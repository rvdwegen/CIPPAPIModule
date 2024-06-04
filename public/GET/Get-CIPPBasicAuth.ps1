function Get-CIPPBasicAuth {
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
    
    Write-Host "Getting Basic Auth for customer: $CustomerTenantID" -ForegroundColor Green
    $BasicAuth = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/listbasicauth?tenantfilter=$CustomerTenantID" -Method Get -Headers $script:AuthHeader -ContentType "application/json"

$BasicAuth

}