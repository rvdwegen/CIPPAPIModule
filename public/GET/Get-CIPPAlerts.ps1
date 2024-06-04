function Get-CIPPAlerts {
    try {
        Invoke-CIPPPreFlightCheck
    } catch {
        Write-Error "$($_.Exception.Message)"
        break
    }
    
    Write-Host "Getting CIPP Alerts" -ForegroundColor Green
    $CIPPAlerts = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/getcippalerts" -Method Get -Headers $script:AuthHeader -ContentType "application/json"

$CIPPAlerts
}

