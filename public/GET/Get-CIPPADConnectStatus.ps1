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

    if ($AzureADConnectSettings) {
        Write-Verbose "Getting AD Connect Settings for: $CustomerTenantID"
    } elseif ($AzureADObjectsInError) {
        Write-Verbose "Getting AD Objects in Error for: $CustomerTenantID"
    } else {
        Write-Verbose "Getting AD Connect Status for: $CustomerTenantID"
    }
        $Endpoint = "/api/listazureadconnectstatus"
        $Params = @{
            tenantfilter = $CustomerTenantID
            datatoreturn = if ($AzureADConnectSettings)
            { "AzureADConnectSettings"}
            elseif ($AzureADObjectsInError)
            { "AzureADObjectsInError"}
        }
        Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params
}