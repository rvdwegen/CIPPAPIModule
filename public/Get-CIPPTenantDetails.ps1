function Get-TenantDetails {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID
        )
    if ($null -eq $Script:CIPPClientID) {
        write-error "Cannot continue: CIPP API information not found. Please run Set-CIPPAPIDetails before connecting to the API."
    }
    Connect-CIPP -CIPPClientID $script:CIPPClientID -CIPPClientSecret $script:CIPPClientSecret -CIPPAPIUrl $script:CIPPAPIUrl -TenantID $TenantID

    $TenantDetails = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/ListTenantDetails?tenantfilter=$CustomerTenantID" -Method Get -Headers $script:AuthHeader -ContentType "application/json"

$TenantDetails

}

