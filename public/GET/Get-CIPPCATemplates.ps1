function Get-CIPPCATemplates {
    try {
        Invoke-CIPPPreFlightCheck
    } catch {
        Write-Error "$($_.Exception.Message)"
        break
    }
    Write-Host "Getting Conditional Access Templates" -ForegroundColor Green
    $request = @{
        Uri = "$script:CIPPAPIUrl/api/listcatemplates"
        Method = 'Get'
        Headers = $script:AuthHeader
        ContentType = 'application/json'
    }
    $CATemplates = Invoke-RestMethod @request

    $CATemplates
}

