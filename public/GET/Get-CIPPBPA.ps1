function Get-CIPPBPA {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $false)]
            [string]$ReportName
        )
    try {
        Invoke-CIPPPreFlightCheck
    } catch {
        Write-Error "$($_.Exception.Message)"
        break
    }
    
    Write-Host "Getting BPA Report for customer: $CustomerTenantID" -ForegroundColor Green
    if ($null -eq $ReportName) {
        $request = @{
            Uri = "$script:CIPPAPIUrl/api/listbpa?tenantFilter=$CustomerTenantID"
            Method = 'Get'
            Headers = $script:AuthHeader
            ContentType = 'application/json'
        }
        $BPA = Invoke-RestMethod @request
    } else {
        $request = @{
            Uri = "$script:CIPPAPIUrl/api/listbpa?tenantFilter=$CustomerTenantID&Report=$ReportName"
            Method = 'Get'
            Headers = $script:AuthHeader
            ContentType = 'application/json'
        }
        $BPA = Invoke-RestMethod @request
    }

$BPA

}