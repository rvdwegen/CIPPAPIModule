function Get-CIPPContacts {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $false)]
            [GUID]$ContactID
        )
    try {
        Invoke-CIPPPreFlightCheck
    } catch {
        Write-Error "$($_.Exception.Message)"
        break
    }
    
    if (-not $ContactID) {
        Write-Host "Getting all Contacts for tenant $CustomerTenantID" -ForegroundColor Green
        $contacts = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/listcontacts?tenantfilter=$CustomerTenantID" -Method Get -Headers $script:AuthHeader -ContentType "application/json"
    } else {
        Write-Host "Getting Contact details for Contact: $ContactID" -ForegroundColor Green
        $contacts = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/listcontacts?contactid=$ContactID&tenantfilter=$CustomerTenantID" -Method Get -Headers $script:AuthHeader -ContentType "application/json"
    }

$contacts

}
