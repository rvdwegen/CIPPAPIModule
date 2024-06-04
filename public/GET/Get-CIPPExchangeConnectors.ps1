function Get-CIPPExchangeConnectors {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID
        )
    try {
        Invoke-CIPPPreFlightCheck
    } catch {
        Write-Error "$($_.Exception.Message)"
        break
    }
    
    Write-Host "Getting Exchange Connectors for customer: $CustomerTenantID" -ForegroundColor Green
    $request = @{
        Uri = "$script:CIPPAPIUrl/api/listexchangeconnectors?tenantfilter=$CustomerTenantID"
        Method = 'Get'
        Headers = $script:AuthHeader
        ContentType = 'application/json'
    }
    $ExchangeConnectors = Invoke-RestMethod @request

    $ExchangeConnectors

}

