function Get-CIPPAutoPilotConfig {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [string]$Type
        )
    if ($null -eq $Script:CIPPClientID) {
        write-error "Cannot continue: CIPP API information not found. Please run Set-CIPPAPIDetails before connecting to the API."
    }
    
    Connect-CIPP -CIPPClientID $script:CIPPClientID -CIPPClientSecret $script:CIPPClientSecret -CIPPAPIUrl $script:CIPPAPIUrl -TenantID $TenantID
    if ($Type -eq "ESP") {
        Write-Host "Getting AutoPilot Status Page for $CustomerTenantID" -ForegroundColor Green
        $AutoPilotConfig = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/listautopilotconfig?tenantfilter=$CustomerTenantID&type=$Type" -Method Get -Headers $script:AuthHeader -ContentType "application/json"
    } elseif ($Type -eq "ApProfile"){
        Write-Host "Getting AutoPilot Profile for customer: $CustomerTenantID" -ForegroundColor Green
        $AutoPilotConfig = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/listautopilotconfig?tenantfilter=$CustomerTenantID&type=$Type" -Method Get -Headers $script:AuthHeader -ContentType "application/json"
    }

$AutoPilotConfig

}

