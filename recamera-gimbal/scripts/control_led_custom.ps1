# LED Control Script for reCamera
$Action = "off"
$RecameraIp = "192.168.31.198"
$RecameraPass = "recamera.1"

$Val = if ($Action -eq "on") { 1 } elseif ($Action -eq "off") { 0 } else { Write-Output "Error: Action must be on or off"; exit 1 }

Write-Host "正在控制相机LED..."
Write-Host "IP地址: $RecameraIp"
Write-Host "操作: 关灯"

# 创建SSH命令
$sshCommand = "echo '$RecameraPass' | sudo -S sh -c 'echo $Val > /sys/class/leds/white/brightness'"

Write-Host "执行命令: $sshCommand"

# 使用plink.exe (PuTTY) 尝试SSH连接
$plinkPath = "C:\Program Files\PuTTY\plink.exe"
if (Test-Path $plinkPath) {
    Write-Host "使用PuTTY连接..."
    & $plinkPath -ssh -batch -pw $RecameraPass recamera@$RecameraIp "echo $Val > /sys/class/leds/white/brightness"
    if ($LASTEXITCODE -eq 0) {
        Write-Host "✓ 相机灯已成功关闭"
    } else {
        Write-Host "✗ 命令执行失败"
    }
} else {
    Write-Host "PuTTY未找到，尝试使用原生SSH..."
    # 直接执行SSH命令
    ssh -o StrictHostKeyChecking=no recamera@$RecameraIp $sshCommand
}