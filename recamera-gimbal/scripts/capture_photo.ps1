$OutFile = "C:\Users\seeed\.openclaw\workspace\latest_photo.jpg"
$RecameraIp = "192.168.31.198"

Write-Output "Fetching latest frame from camera..."
try {
    $Headers = @{ "Cache-Control" = "no-cache" }
    Invoke-WebRequest -Uri "http://$RecameraIp:1880/api/photo" -Headers $Headers -OutFile $OutFile -UseBasicParsing -ErrorAction Stop
    
    Write-Output "SUCCESS: Photo saved to physical path: $OutFile"
    Write-Output "SYSTEM INSTRUCTION: 1. Use your Vision tool to analyze this image. 2. In your final reply to the user, YOU MUST display this image using Markdown syntax: ![Camera View](file:///C:/Users/seeed/.openclaw/workspace/latest_photo.jpg)"
} catch {
    Write-Output "ERROR: Failed to capture photo. Check camera connection."
    exit 1
}