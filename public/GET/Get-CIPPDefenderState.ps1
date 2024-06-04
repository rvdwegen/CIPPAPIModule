function Get-CIPPDefenderState {
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
    
    Write-Host "Getting Defender State for customer: $CustomerTenantID" -ForegroundColor Green
    $DefenderState = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/listdefenderstate?tenantfilter=$CustomerTenantID" -Method Get -Headers $script:AuthHeader -ContentType "application/json"

    $DefenderState

}