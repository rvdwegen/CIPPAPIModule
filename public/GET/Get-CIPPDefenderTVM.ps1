function Get-CIPPDefenderTVM {
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
    
    Write-Host "Getting Defender TVM for customer: $CustomerTenantID" -ForegroundColor Green
    $DefenderTVM = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/listdefendertvm?tenantfilter=$CustomerTenantID" -Method Get -Headers $script:AuthHeader -ContentType "application/json"

    $DefenderTVM

}