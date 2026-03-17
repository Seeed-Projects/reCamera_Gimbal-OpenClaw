param (
    [string]$Action
)
$RecameraIp = "192.168.31.198"
$RecameraPass = "recamera.1"

if ($Action -eq "on") { 
    $Val = 1 
} elseif ($Action -eq "off") { 
    $Val = 0 
} else { 
    Write-Output "Error: Action must be on or off"
    exit 1 
}

ssh -o StrictHostKeyChecking=no recamera@$RecameraIp "echo '$RecameraPass' | sudo -S sh -c 'echo $Val > /sys/class/leds/white/brightness'"