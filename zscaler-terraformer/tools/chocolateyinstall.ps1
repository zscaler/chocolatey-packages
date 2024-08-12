$ErrorActionPreference = 'Stop'
$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

# Define package details
$packageName = 'zscaler-terraformer'
$unzipLocation = "$toolsDir\zscaler-terraformer"

# URL and checksum for the .zip file
$url = 'https://github.com/zscaler/zscaler-terraformer/releases/download/v1.3.0/zscaler-terraformer_1.3.0_windows_amd64.zip'
$checksum = '84408b4496a87298d70d955f3c300571ba5ed7559ab3d967ef02e6efe41e5fd0'

# Download, verify, and unzip the package
$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $unzipLocation
    fileType       = 'zip'
    url            = $url
    checksum       = $checksum
    checksumType   = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs

# Move the executable to a directory in the system PATH
$exePath = "$unzipLocation\zscaler-terraformer.exe"
$destinationPath = "$Env:ProgramFiles\zscaler-terraformer"

# Ensure the destination directory exists
if (-not (Test-Path $destinationPath)) {
    New-Item -Path $destinationPath -ItemType Directory -Force
}

# Check if the file already exists and remove it if necessary
$destinationFile = "$destinationPath\zscaler-terraformer.exe"
if (Test-Path $destinationFile) {
    Remove-Item -Path $destinationFile -Force
}

# Move the executable
Move-Item -Path $exePath -Destination $destinationPath

# Clean up the temporary directory
Remove-Item -Recurse -Force $unzipLocation -ErrorAction SilentlyContinue
