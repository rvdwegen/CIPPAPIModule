function Get-CIPPVersion {
    try {
        Invoke-CIPPPreFlightCheck
    } catch {
        Write-Error "$($_.Exception.Message)"
        break
    }

    Write-Host "Getting CIPP Version" -ForegroundColor Green
    $Version = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/Getversion" -Method Get -Headers $script:AuthHeader -ContentType "application/json"

$Version
}

