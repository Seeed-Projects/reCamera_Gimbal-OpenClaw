param (
    [string]$Action
)
$RecameraIp = "192.168.31.198"
$RecameraPass = "recamera.1"

$Val = if ($Action -eq "on") { 1 } elseif ($Action -eq "off") { 0 } else { throw "参数错误，只能是 on 或 off" }

# 使用PowerShell的Start-Process来处理SSH命令
$command = "echo '$RecameraPass' | sudo -S sh -c 'echo $Val > /sys/class/leds/white/brightness'"
$arguments = @(
    "-o", "StrictHostKeyChecking=no",
    "recamera@$RecameraIp",
    $command
)

Start-Process -FilePath "ssh.exe" -ArgumentList $arguments -Wait -NoNewWindow