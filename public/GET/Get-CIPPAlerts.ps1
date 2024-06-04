function Get-CIPPAlerts {
    try {
        Invoke-CIPPPreFlightCheck
    } catch {
        Write-Error "$($_.Exception.Message)"
        break
    }
    
    Write-Host "Getting CIPP Alerts" -ForegroundColor Green
    $request = @{
        Uri = "$script:CIPPAPIUrl/api/getcippalerts"
        Method = 'Get'
        Headers = $script:AuthHeader
        ContentType = 'application/json'
    }
    $CIPPAlerts = Invoke-RestMethod @request

$CIPPAlerts
}

