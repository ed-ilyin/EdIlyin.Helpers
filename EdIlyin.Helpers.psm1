function Get-EihHelp {
    param (
        [Parameter(ValueFromPipeline)][string]$Name
    )
    $Command = $Name | gcm
    if ($Command.ResolvedCommand) {
        $Alias = $Command.DisplayName
        $Command = $Command.ResolvedCommand
    }
    else {
        $Alias = "$(gal -def $Name -ea SilentlyContinue)"
    }
    [pscustomobject]@{
        Alias = $Alias
        ParameterSets = $Command.ParameterSets
    } | Write-Output
}
function Show-EihHelp {
    param (
        [Parameter(ValueFromPipeline)][string]$Name
    )
    $Name | Get-EihHelp | Show-Object -d 5
}
