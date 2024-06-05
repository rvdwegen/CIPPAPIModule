function Invoke-CIPPRestMethod {
    param (
        [string]$Endpoint,
        [hashtable]$Params = @{},
        [string]$Method = 'GET',
        [string]$Body = $null,
        [string]$ContentType = 'application/json',
        [string]$Authorization = $null
    )

    try {
        Invoke-CIPPPreFlightCheck
    } catch {
        Write-Error "$($_.Exception.Message)"
        break
    }

    $Headers = $script:AuthHeader
    # Assemble parameters
    $ParamCollection = [System.Web.HttpUtility]::ParseQueryString([String]::Empty)

    $Params.GetEnumerator() | ForEach-Object {
        $ParamCollection.Add($_.Key, $_.Value)
    }
    $Request = $ParamCollection.ToString()

    $UriBuilder = [System.UriBuilder]('{0}{1}' -f $script:CIPPAPIUrl, $Endpoint)
    $UriBuilder.Query = $Request

    $Request = @{
        Uri         = $UriBuilder.Uri
        Method      = $Method
        Headers     = $Headers
        ContentType = $ContentType
    }

    $response = Invoke-RestMethod @Request
    return $response    
}