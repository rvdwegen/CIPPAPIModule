<#
.SYNOPSIS
    Retrieves the AD Connect status for a specified customer tenant.

.DESCRIPTION
    The Get-CIPPADConnectStatus function retrieves the AD Connect status for a specified customer tenant. It can also retrieve the AD Connect settings or the AD objects in error for the tenant.

.PARAMETER CustomerTenantID
    Specifies the ID of the customer tenant for which to retrieve the AD Connect status.

.PARAMETER AzureADConnectSettings
    Retrieves the AD Connect settings for the specified customer tenant. This parameter is optional.

.PARAMETER AzureADObjectsInError
    Retrieves the AD objects in error for the specified customer tenant. This parameter is optional.

.EXAMPLE
    Get-CIPPADConnectStatus -CustomerTenantID "contoso.onmicrosoft.com"
    Retrieves the AD Connect status for the "contoso.onmicrosoft.com" tenant.

.EXAMPLE
    Get-CIPPADConnectStatus -CustomerTenantID "contoso.onmicrosoft.com" -AzureADConnectSettings
    Retrieves the AD Connect settings for the "contoso.onmicrosoft.com" tenant.

.EXAMPLE
    Get-CIPPADConnectStatus -CustomerTenantID "contoso.onmicrosoft.com" -AzureADObjectsInError
    Retrieves the AD objects in error for the "contoso.onmicrosoft.com" tenant.
#>

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

    try {
        Invoke-CIPPPreFlightCheck
    } catch {
        Write-Error "$($_.Exception.Message)"
        break
    }

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