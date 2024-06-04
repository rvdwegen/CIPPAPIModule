function Get-CIPPAutoPilotConfig {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [string]$Type
        )
    try {
        Invoke-CIPPPreFlightCheck
    } catch {
        Write-Error "$($_.Exception.Message)"
        break
    }
    
    if ($Type -eq "ESP") {
        Write-Host "Getting AutoPilot Status Page for $CustomerTenantID" -ForegroundColor Green
        $AutoPilotConfig = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/listautopilotconfig?tenantfilter=$CustomerTenantID&type=$Type" -Method Get -Headers $script:AuthHeader -ContentType "application/json"
    } elseif ($Type -eq "ApProfile"){
        Write-Host "Getting AutoPilot Profile for customer: $CustomerTenantID" -ForegroundColor Green
        $AutoPilotConfig = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/listautopilotconfig?tenantfilter=$CustomerTenantID&type=$Type" -Method Get -Headers $script:AuthHeader -ContentType "application/json"
    }

$AutoPilotConfig

}

