function Get-TokenExpiry {
    <#
    .SYNOPSIS
        Calculates and returns the expiry date/time of a Microsoft token.
    .DESCRIPTION
        Takes the expires in time for an auth token and returns a PowerShell date/time object containing the expiry date/time of the token.
    .OUTPUTS
        A powershell date/time object representing the token expiry.
    #>
    [CmdletBinding()]
    [OutputType([DateTime])]
    param (
        # Timestamp value for token expiry. e.g 3600
        [Parameter(
            Mandatory = $false
        )]
        [int64]$ExpiresIn = $script:ExpiresIn
    )
    if ($script:ExpiresIn -eq $null) {
        return
    } else {
        $Script:ExpiryDateTime = $script:TokenAcquiredTime.AddSeconds($script:ExpiresIn)
        Write-Verbose "Calcuated token expiry as $Script:ExpiryDateTime"
        Return $script:ExpiryDateTime
    }
}