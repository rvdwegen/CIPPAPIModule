function Get-CIPPApps {
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
    
    Write-Host "Getting Apps for $CustomerTenantID" -ForegroundColor Green
    $Apps = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/listapps?tenantfilter=$CustomerTenantID" -Method Get -Headers $script:AuthHeader -ContentType "application/json"

$Apps

}