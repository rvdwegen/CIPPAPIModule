function Build-Url {
    param (
        [string]$Endpoint,
        [hashtable]$Params
    )
    $BaseDomain = $script:CIPPAPIUrl
    $url = "$BaseDomain$Endpoint"
    if ($Params.Count -gt 0) {
        $queryString = $Params.GetEnumerator() | ForEach-Object { "$($_.Key)=$($_.Value)" } | Out-String
        $queryString = $queryString -replace "\r\n", "&" -replace "\s+", ""
        $url += "?" + $queryString.TrimEnd("&")
    }
    return $url
}