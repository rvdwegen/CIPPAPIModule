function Get-CIPPDomainAnalyser {
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
    
    Write-Host "Getting Domain Analyser List for customer: $CustomerTenantID" -ForegroundColor Green
    $DomainAnalyser = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/ListDomainAnalyser?tenantfilter=$CustomerTenantID" -Method Get -Headers $script:AuthHeader -ContentType "application/json"

$DomainAnalyser

}

