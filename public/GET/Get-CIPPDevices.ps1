function Get-CIPPDevices {
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
    
    Write-Host "Getting Devices for customer: $CustomerTenantID" -ForegroundColor Green
    $request = @{
        Uri = "$script:CIPPAPIUrl/api/listdevices?tenantfilter=$CustomerTenantID"
        Method = 'Get'
        Headers = $script:AuthHeader
        ContentType = 'application/json'
    }
    $Devices = Invoke-RestMethod @request

    $Devices

}

