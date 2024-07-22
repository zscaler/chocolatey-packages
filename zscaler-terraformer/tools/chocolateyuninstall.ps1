$installPath = "$(Split-Path -Parent $MyInvocation.MyCommand.Definition)\zscaler-terraformer"

if (Test-Path $installPath) {
    Remove-Item -Recurse -Force $installPath
}
