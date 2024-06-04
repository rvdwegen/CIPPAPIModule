function Get-CIPPGroups {
    [CmdletBinding()]
        Param(
            [Parameter(Mandatory = $true)]
            [string]$CustomerTenantID,
            [Parameter(Mandatory = $false)]
            [GUID]$GroupID,
            [Parameter(Mandatory = $false)]
            [switch]$Members,
            [Parameter(Mandatory = $false)]
            [switch]$Owners
        )
    try {
        Invoke-CIPPPreFlightCheck
    } catch {
        Write-Error "$($_.Exception.Message)"
        break
    }
    
    if (-not $GroupID) {
        Write-Host "Getting all Groups for tenant $CustomerTenantID" -ForegroundColor Green
        $request = @{
            Uri = "$script:CIPPAPIUrl/api/listgroups?tenantfilter=$CustomerTenantID"
            Method = 'Get'
            Headers = $script:AuthHeader
            ContentType = 'application/json'
        }
        $Groups = Invoke-RestMethod @request
    } elseif ($GroupID -and -not $Members -and -not $Owners) {
        Write-Host "Getting Group Details for Group $GroupID" -ForegroundColor Green
        $request = @{
            Uri = "$script:CIPPAPIUrl/api/listgroups?GroupId=$GroupID&tenantfilter=$CustomerTenantID"
            Method = 'Get'
            Headers = $script:AuthHeader
            ContentType = 'application/json'
        }
        $Groups = Invoke-RestMethod @request
    } elseif ($GroupID -and $Members -and -not $Owners) {
        Write-Host "Getting Group Members for Group $GroupID" -ForegroundColor Green
        $request = @{
            Uri = "$script:CIPPAPIUrl/api/listgroups?GroupId=$GroupID&tenantfilter=$CustomerTenantID&members=true"
            Method = 'Get'
            Headers = $script:AuthHeader
            ContentType = 'application/json'
        }
        $Groups = Invoke-RestMethod @request
    } elseif ($GroupID -and -not $Members -and $Owners) {
        Write-Host "Getting Group Owners for Group $GroupID" -ForegroundColor Green
        $request = @{
            Uri = "$script:CIPPAPIUrl/api/listgroups?GroupId=$GroupID&tenantfilter=$CustomerTenantID&owners=true"
            Method = 'Get'
            Headers = $script:AuthHeader
            ContentType = 'application/json'
        }
        $Groups = Invoke-RestMethod @request
    } 
    $Groups

}

