param (
    [string]$Action
)
$RecameraIp = "192.168.31.198"
$RecameraPass = "recamera.1"

if (-not $RecameraIp -or -not $RecameraPass) {
    Write-Error "环境变量缺失"
    exit 1
}

$Val = if ($Action -eq "on") { 1 } elseif ($Action -eq "off") { 0 } else { throw "参数错误，只能是 on 或 off" }

# 创建一个临时脚本文件来包含密码和命令
$tempFile = [System.IO.Path]::GetTempFileName()
$tempScript = @"
#!/bin/bash
echo '$RecameraPass' | sudo -S sh -c 'echo $Val > /sys/class/leds/white/brightness'
"@
$tempScript | Out-File -FilePath $tempFile -Encoding ASCII

# 使用SCP将临时脚本复制到远程主机
scp -o StrictHostKeyChecking=no $tempFile recamera@$RecameraIp:/tmp/control_led.sh

# 执行远程脚本
ssh -o StrictHostKeyChecking=no recamera@$RecameraIp "chmod +x /tmp/control_led.sh && /tmp/control_led.sh"

# 清理临时文件
Remove-Item $tempFile