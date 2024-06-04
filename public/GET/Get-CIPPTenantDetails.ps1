function Get-CIPPTenantDetails {
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

    $request = @{
        Uri = "$script:CIPPAPIUrl/api/ListTenantDetails?tenantfilter=$CustomerTenantID"
        Method = 'Get'
        Headers = $script:AuthHeader
        ContentType = 'application/json'
    }

    $TenantDetails = Invoke-RestMethod @request

$TenantDetails

}

