function Get-CIPPUsers {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $false)]
            [GUID]$UserID
        )
    try {
        Invoke-CIPPPreFlightCheck
    } catch {
        Write-Error "$($_.Exception.Message)"
        break
    }
    
    if (-not $UserID) {
        Write-Host "Getting all users for tenant $CustomerTenantID" -ForegroundColor Green
        $Users = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/Listusers?tenantfilter=$CustomerTenantID" -Method Get -Headers $script:AuthHeader -ContentType "application/json"
    } else {
        Write-Host "Getting user details for user $UserID" -ForegroundColor Green
        $Users = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/Listusers?userId=$UserID&tenantfilter=$CustomerTenantID" -Method Get -Headers $script:AuthHeader -ContentType "application/json"
    }

$Users

}

