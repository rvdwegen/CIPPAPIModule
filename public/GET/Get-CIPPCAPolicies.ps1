function Get-CIPPCAPolicies {
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
    
    Write-Host "Getting Conditional Access Policies for customer: $CustomerTenantID" -ForegroundColor Green
    $CAPolicies = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/listconditionalaccesspolicies?tenantfilter=$CustomerTenantID" -Method Get -Headers $script:AuthHeader -ContentType "application/json"

$CAPolicies

}