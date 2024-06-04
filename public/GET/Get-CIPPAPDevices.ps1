function Get-CIPPAPDevices {
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

    Write-Host "Getting AutoPilot Devices for $CustomerTenantID" -ForegroundColor Green
    $APDevices = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/listapdevices?tenantfilter=$CustomerTenantID" -Method Get -Headers $script:AuthHeader -ContentType "application/json"

$APDevices

}