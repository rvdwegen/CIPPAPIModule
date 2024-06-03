function Get-CIPPADConnectStatus {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $false)]
            [switch]$AzureADConnectSettings,
            [Parameter(Mandatory = $false)]
            [switch]$AzureADObjectsInError
        )
    if ($null -eq $Script:CIPPClientID) {
        write-error "Cannot continue: CIPP API information not found. Please run Set-CIPPAPIDetails before connecting to the API."
    }
    Connect-CIPP -CIPPClientID $script:CIPPClientID -CIPPClientSecret $script:CIPPClientSecret -CIPPAPIUrl $script:CIPPAPIUrl -TenantID $TenantID
    if ($AzureADConnectSettings){
        Write-Host "Getting AD Connect Settings for: $CustomerTenantID" -ForegroundColor Green
        $ADConnectStatus = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/listazureadconnectstatus?tenantfilter=$CustomerTenantID&datatoreturn=AzureADConnectSettings" -Method Get -Headers $script:AuthHeader -ContentType "application/json"
    } elseif ($AzureADObjectsInError){
        Write-Host "Getting AD Connect AD Objects in Error for: $CustomerTenantID" -ForegroundColor Green
        $ADConnectStatus = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/listazureadconnectstatus?tenantfilter=$CustomerTenantID&datatoreturn=AzureADObjectsInError" -Method Get -Headers $script:AuthHeader -ContentType "application/json"
    } else {
        Write-Host "Getting AD Connect Status for: $CustomerTenantID" -ForegroundColor Green
        $ADConnectStatus = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/listazureadconnectstatus?tenantfilter=$CustomerTenantID" -Method Get -Headers $script:AuthHeader -ContentType "application/json"
    }
$ADConnectStatus

}