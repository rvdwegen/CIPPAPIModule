function Get-CIPPExchangeConnectorTemplates {
    try {
        Invoke-CIPPPreFlightCheck
    } catch {
        Write-Error "$($_.Exception.Message)"
        break
    }
    
    Write-Host "Getting Exchange Connectors Templates" -ForegroundColor Green
    $ExchangeConnectorTemplates = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/listexconnectortemplates" -Method Get -Headers $script:AuthHeader -ContentType "application/json"

    $ExchangeConnectorTemplates

}

