function Get-CIPPTenantDetails {
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

    $TenantDetails = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/ListTenantDetails?tenantfilter=$CustomerTenantID" -Method Get -Headers $script:AuthHeader -ContentType "application/json"

$TenantDetails

}

