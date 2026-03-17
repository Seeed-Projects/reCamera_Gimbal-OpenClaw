$RecameraIp = "192.168.31.198"
$RecameraPass = "recamera.1"

ssh -o StrictHostKeyChecking=no recamera@$RecameraIp "echo '$RecameraPass' | sudo -S aplay -D hw:1,0 /home/recamera/test.wav"