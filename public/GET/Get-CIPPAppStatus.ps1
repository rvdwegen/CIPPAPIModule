function Get-CIPPAppStatus {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID
        )
    
    Write-Verbose "Getting Apps Status for $CustomerTenantID"
    $Endpoint = "/api/listappstatus"
    $Params = @{
        tenantfilter = $CustomerTenantID
    }
    
    Invoke-CIPPRestMethod -Endpoint $Endpoint -Params $Params
}