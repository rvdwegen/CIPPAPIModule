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

    # Define the endpoint and parameters
    $endpoint = "/api/ListDomains"
    $params = @{
        tenantfilter = $CustomerTenantID
    }

    # Build the full URL with query parameters
    $url = Build-Url -Endpoint $endpoint -Params $params

    $request = @{
        Uri = $url
        Method = 'Get'
        Headers = $script:AuthHeader
        ContentType = 'application/json'
    }
    $DomainList = Invoke-RestMethod @request

$DomainList

}

