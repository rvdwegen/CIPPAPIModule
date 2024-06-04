function Get-CIPPBPATemplates {
    try {
        Invoke-CIPPPreFlightCheck
    } catch {
        Write-Error "$($_.Exception.Message)"
        break
    }
    
    Write-Host "Getting BPA Templates" -ForegroundColor Green
    $request = @{
        Uri = "$script:CIPPAPIUrl/api/listbpatemplates"
        Method = 'Get'
        Headers = $script:AuthHeader
        ContentType = 'application/json'
    }
    $BPATemplates = Invoke-RestMethod @request
    
    $BPATemplates

}