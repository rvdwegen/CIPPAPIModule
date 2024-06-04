function Get-CIPPAppStatus {
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
    
    Write-Host "Getting Apps Status for $CustomerTenantID" -ForegroundColor Green
    $request = @{
        Uri = "$script:CIPPAPIUrl/api/listappstatus?tenantfilter=$CustomerTenantID"
        Method = 'Get'
        Headers = $script:AuthHeader
        ContentType = 'application/json'
    }
    $AppStatus = Invoke-RestMethod @request
    $AppStatus

}