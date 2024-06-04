function Get-CIPPCalendarPerms {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $true)]
            [string]$UserID
        )
    try {
        Invoke-CIPPPreFlightCheck
    } catch {
        Write-Error "$($_.Exception.Message)"
        break
    }

    Write-Host "Getting user calender permissions for user: $UserID" -ForegroundColor Green
    $request = @{
        Uri = "$script:CIPPAPIUrl/api/listcalendarpermissions?userId=$UserID&tenantfilter=$CustomerTenantID"
        Method = 'Get'
        Headers = $script:AuthHeader
        ContentType = 'application/json'
    }
    $CalPerms = Invoke-RestMethod @request

$CalPerms

}

