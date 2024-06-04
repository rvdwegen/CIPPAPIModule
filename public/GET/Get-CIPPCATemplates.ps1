function Get-CIPPCATemplates {
    try {
        Invoke-CIPPPreFlightCheck
    } catch {
        Write-Error "$($_.Exception.Message)"
        break
    }
    Write-Host "Getting Conditional Access Templates" -ForegroundColor Green
    $CATemplates = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/listcatemplates" -Method Get -Headers $script:AuthHeader -ContentType "application/json"

    $CATemplates
}

