function Get-CIPPUsers {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $false)]
            [GUID]$UserID
        )
    if ($null -eq $Script:CIPPClientID) {
        write-error "Cannot continue: CIPP API information not found. Please run Set-CIPPAPIDetails before connecting to the API."
    }
    
    Connect-CIPP -CIPPClientID $script:CIPPClientID -CIPPClientSecret $script:CIPPClientSecret -CIPPAPIUrl $script:CIPPAPIUrl -TenantID $TenantID
    if ($null -eq $UserID) {
        Write-Host "Getting all users for tenant $CustomerTenantID" -ForegroundColor Green
        $Users = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/Listusers?tenantfilter=$CustomerTenantID" -Method Get -Headers $script:AuthHeader -ContentType "application/json"
    } else {
        Write-Host "Getting user details for user $UserID" -ForegroundColor Green
        $Users = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/Listusers?userId=$UserID&tenantfilter=$CustomerTenantID" -Method Get -Headers $script:AuthHeader -ContentType "application/json"
    }

$Users

}

