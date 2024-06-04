function Get-CIPPExternalTenantInfo {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$Tenant
        )
    try {
        Invoke-CIPPPreFlightCheck
    } catch {
        Write-Error "$($_.Exception.Message)"
        break
    }
    
    Write-Host "Getting Tenant info for $Tenant" -ForegroundColor Green
    $ExtTenant = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/ListExternalTenantInfo?tenant=$Tenant" -Method Get -Headers $script:AuthHeader -ContentType "application/json"

$ExtTenant

}