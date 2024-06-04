function Invoke-CIPPPreFlightCheck {
    if ($null -eq $Script:CIPPClientID -or 
    $null -eq $Script:CIPPClientSecret -or 
    $null -eq $Script:CIPPAPIUrl -or 
    $null -eq $Script:TenantID) {
        throw "Cannot continue: CIPP API information not found. Please run Set-CIPPAPIDetails before connecting to the API."
        break
    }
    $null = Get-TokenExpiry
    if ($null -eq $Script:ExpiryDateTime) {
        write-Host "Token not found. Connecting to CIPP for the first time." -ForegroundColor Green
        Connect-CIPP -CIPPClientID $script:CIPPClientID -CIPPClientSecret $script:CIPPClientSecret -CIPPAPIUrl $script:CIPPAPIUrl -TenantID $TenantID
    }
    elseif ($script:ExpiryDateTime -lt (Get-Date)) {
        write-warning "Token has expired. Reconnecting to CIPP."
        Connect-CIPP -CIPPClientID $script:CIPPClientID -CIPPClientSecret $script:CIPPClientSecret -CIPPAPIUrl $script:CIPPAPIUrl -TenantID $TenantID
    } else {
        Write-Host "Token is still valid. Expiry: $script:ExpiryDateTime" -ForegroundColor Green
    }
}