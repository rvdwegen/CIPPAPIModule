function Set-CIPPAPIDetails {
    [CmdletBinding()]
    Param(
        [Parameter(ParameterSetName = 'CIPP', Mandatory = $true)]
        [string]$CIPPClientID,
        [Parameter(ParameterSetName = 'CIPP', Mandatory = $true)]
        [String]$CIPPClientSecret,
        [Parameter(ParameterSetName = 'CIPP', Mandatory = $true)]
        [String]$CIPPAPIUrl,
        [Parameter(ParameterSetName = 'CIPP', Mandatory = $true)]
        [String]$TenantID
    )
    write-host "Setting CIPP API Keys" -ForegroundColor Green
    $script:CIPPClientID = $CIPPClientID
    $script:CIPPClientSecret = $CIPPClientSecret
    $script:CIPPAPIUrl = $CIPPAPIUrl
    $script:TenantID = $TenantID
}