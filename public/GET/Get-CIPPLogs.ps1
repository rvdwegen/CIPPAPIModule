function Get-CIPPLogs {
    try {
        Invoke-CIPPPreFlightCheck
    } catch {
        Write-Error "$($_.Exception.Message)"
        break
    }
    Write-Host "Getting CIPP Logs" -ForegroundColor Green
    $request = @{
        Uri = "$script:CIPPAPIUrl/api/ListLogs"
        Method = 'Get'
        Headers = $script:AuthHeader
        ContentType = 'application/json'
    }
    $Logs = Invoke-RestMethod @request

$Logs
}

