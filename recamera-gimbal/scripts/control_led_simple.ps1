param (
    [string]$Action
)
$RecameraIp = "192.168.31.198"
$RecameraPass = "recamera.1"

$Val = if ($Action -eq "on") { 1 } elseif ($Action -eq "off") { 0 } else { throw "参数错误，只能是 on 或 off" }

# 直接使用SSH命令
$command = "echo '$RecameraPass' | sudo -S sh -c 'echo $Val > /sys/class/leds/white/brightness'"
ssh -o StrictHostKeyChecking=no recamera@$RecameraIp $command