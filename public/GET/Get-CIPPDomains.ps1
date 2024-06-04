function Get-CIPPDomains {
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
    
    Write-Host "Getting Domains for customer: $CustomerTenantID" -ForegroundColor Green
    $request = @{
        Uri = "$script:CIPPAPIUrl/api/ListDomains?tenantfilter=$CustomerTenantID"
        Method = 'Get'
        Headers = $script:AuthHeader
        ContentType = 'application/json'
    }
    $DomainList = Invoke-RestMethod @request

$DomainList

}

