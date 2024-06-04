function Get-CIPPVersion {
    try {
        Invoke-CIPPPreFlightCheck
    } catch {
        Write-Error "$($_.Exception.Message)"
        break
    }

    Write-Host "Getting CIPP Version" -ForegroundColor Green
    $request = @{
        Uri = "$script:CIPPAPIUrl/api/Getversion"
        Method = 'Get'
        Headers = $script:AuthHeader
        ContentType = 'application/json'
    }
    $Version = Invoke-RestMethod @request

$Version
}

