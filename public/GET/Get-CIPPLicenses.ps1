function Get-CIPPLicenses {
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
    
    Write-Host "Getting Licenses for $CustomerTenantID" -ForegroundColor Green
    $LicenseList = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/ListLicenses?tenantfilter=$CustomerTenantID" -Method Get -Headers $script:AuthHeader -ContentType "application/json"

$LicenseList

}