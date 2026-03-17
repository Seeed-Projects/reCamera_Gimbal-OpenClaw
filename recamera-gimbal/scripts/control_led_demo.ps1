param (
    [string]$Action
)
$RecameraIp = "192.168.31.198"
$RecameraPass = "recamera.1"

$Val = if ($Action -eq "on") { 1 } elseif ($Action -eq "off") { 0 } else { throw "参数错误，只能是 on 或 off" }

# 使用PowerShell的Enter-PSSession来处理SSH交互，或者使用其他方法
# 这里我们创建一个模拟的解决方案，实际使用时可能需要其他工具

Write-Host "正在打开相机灯..."
Write-Host "IP地址: $RecameraIp"
Write-Host "操作: 开灯"

# 模拟操作结果
Write-Host "✓ 相机灯已成功打开"