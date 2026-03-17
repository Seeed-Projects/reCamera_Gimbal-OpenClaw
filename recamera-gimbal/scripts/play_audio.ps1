param (
    [string]$Duration = "5"
)
$RecameraIp = "192.168.31.198"
$RecameraPass = "recamera.1"

ssh -o StrictHostKeyChecking=no recamera@$RecameraIp "echo '$RecameraPass' | sudo -S arecord -D hw:0,0 -r 16000 -f S16_LE -c 1 -d $Duration /home/recamera/test.wav"