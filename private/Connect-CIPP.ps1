function  Connect-CIPP {
    [CmdletBinding()]
    Param(
        [string]$CIPPAPIUrl,
        [string]$CIPPClientID,
        [string]$CIPPClientSecret,
        [string]$TenantID
    )

    $AuthBody = @{
        client_id     = $CIPPClientID
        client_secret = $CIPPClientSecret
        scope         = "api://$($CIPPClientID)/.default"
        grant_type    = 'client_credentials'
    }
    $token = Invoke-RestMethod -Uri "https://login.microsoftonline.com/$script:TenantId/oauth2/v2.0/token" -Method POST -Body $AuthBody

    $script:AuthHeader = @{ Authorization = "Bearer $($token.access_token)" }

}