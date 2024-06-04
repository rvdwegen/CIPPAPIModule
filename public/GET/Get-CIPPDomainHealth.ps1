function Get-CIPPDomainHealth {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$DomainName,
            [Parameter(Mandatory = $false)]
            [switch]$ReadWhoisRecord,
            [Parameter(Mandatory = $false)]
            [switch]$ReadNSRecord,
            [Parameter(Mandatory = $false)]
            [switch]$ReadMXRecord,
            [Parameter(Mandatory = $false)]
            [switch]$ReadSpfRecord,
            [Parameter(Mandatory = $false)]
            [switch]$ReadDmarcPolicy,
            [Parameter(Mandatory = $false)]
            [switch]$ReadDkimRecord,
            [Parameter(Mandatory = $false)]
            [switch]$TestDNSSEC,
            [Parameter(Mandatory = $false)]
            [switch]$TestMtaSts
        )

    try {
        Invoke-CIPPPreFlightCheck
    } catch {
        Write-Error "$($_.Exception.Message)"
        break
    }
    
    Write-Host "Getting Domain Health for $DomainName" -ForegroundColor Green
    $action = $null
    $switchCount = 0

    if ($ReadWhoisRecord) { $action = "ReadWhoisRecord"; $switchCount++ }
    if ($ReadNSRecord) { $action = "ReadNSRecord"; $switchCount++ }
    if ($ReadMXRecord) { $action = "ReadMXRecord"; $switchCount++ }
    if ($ReadSpfRecord) { $action = "ReadSpfRecord"; $switchCount++ }
    if ($ReadDmarcPolicy) { $action = "ReadDmarcPolicy"; $switchCount++ }
    if ($ReadDkimRecord) { $action = "ReadDkimRecord"; $switchCount++ }
    if ($TestDNSSEC) { $action = "TestDNSSEC"; $switchCount++ }
    if ($TestMtaSts) { $action = "TestMtaSts"; $switchCount++ }

    if ($switchCount -gt 1) {
        Write-Error "Only one action switch can be specified at a time."
        return
    } elseif ($switchCount -eq 0) {
        Write-Error "At least one action switch must be specified."
        return
    }

    $DomainHealth = Invoke-RestMethod -Uri "$script:CIPPAPIUrl/api/listdomainhealth?Domain=$DomainName&Action=$action" -Method Get -Headers $script:AuthHeader -ContentType "application/json"

    $DomainHealth
}