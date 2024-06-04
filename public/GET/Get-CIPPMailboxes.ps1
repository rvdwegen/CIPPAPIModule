function Get-CIPPMailboxes {
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
    
    Write-Host "Getting Mailbox List for $CustomerTenantID" -ForegroundColor Green
    $MailboxList = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/ListMailboxes?tenantfilter=$CustomerTenantID" -Method Get -Headers $script:AuthHeader -ContentType "application/json"

$MailboxList

}

