function Get-CIPPAppConsentReqs {
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
    
    Write-Host "Getting app consent requests for customer: $CustomerTenantID" -ForegroundColor Green
    $Requests = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/listappconsentrequests?tenantfilter=$CustomerTenantID" -Method Get -Headers $script:AuthHeader -ContentType "application/json"

$Requests

}