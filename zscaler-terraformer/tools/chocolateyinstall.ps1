$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

# Define package details
$packageName = 'zscaler-terraformer'
$zipFile = "$toolsDir\zscaler-terraformer_1.3.0_windows_amd64.zip"
$unzipLocation = "$toolsDir\zscaler-terraformer"

# URL and checksum for the .zip file
$url = 'https://github.com/zscaler/zscaler-terraformer/releases/download/v1.3.0/zscaler-terraformer_1.3.0_windows_amd64.zip'
$checksum = '84408b4496a87298d70d955f3c300571ba5ed7559ab3d967ef02e6efe41e5fd0'

# Download the zip file
Get-ChocolateyWebFile -PackageName $packageName -FileFullPath $zipFile -Url64bit $url -Checksum64 $checksum -ChecksumType64 sha256

# Unzip the package
$packageArgs = @{
    packageName    = $packageName
    FileFullPath   = $zipFile
    Destination    = $unzipLocation
}

Get-ChocolateyUnzip @packageArgs

# Move the executable to a directory in the system PATH
$exePath = "$unzipLocation\zscaler-terraformer.exe"
$destinationPath = "C:\Program Files\zscaler-terraformer"
if (-not (Test-Path $destinationPath)) {
    New-Item -Path $destinationPath -ItemType Directory -Force
}
Move-Item -Path $exePath -Destination $destinationPath

# Clean up the zip file
Remove-Item -Path $zipFile -Force -ErrorAction SilentlyContinue
