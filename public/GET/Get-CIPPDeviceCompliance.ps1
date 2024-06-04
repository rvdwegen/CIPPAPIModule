function Get-CIPPDeviceCompliance {
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
    
    Write-Host "Getting Device Compliance for $CustomerTenantID" -ForegroundColor Green
    $DeviceCompliance = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/listalltenantdevicecompliance?tenantfilter=$CustomerTenantID" -Method Get -Headers $script:AuthHeader -ContentType "application/json"

$DeviceCompliance

}