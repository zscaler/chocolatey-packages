 <#
.SYNOPSIS
Installs the Zscaler Terraformer CLI.

Authors: Zscaler Technology Alliances <devrel@zscaler.com>

.DESCRIPTION
This script installs the Zscaler Terraformer Command Line Interface.

#>

$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

# Define package details
$packageName = 'zscaler-terraformer'

# URL and checksum for the 64-bit .zip file
$url64bit = 'https://github.com/zscaler/zscaler-terraformer/releases/download/v1.3.5/zscaler-terraformer_1.3.5_windows_amd64.zip'
$checksum64bit = 'f78df773d94f260778d155e72f1c7377954d60bad2094bd3b3914df1fa1bd7fb'

# URL and checksum for the 32-bit .zip file
$url32bit = 'https://github.com/zscaler/zscaler-terraformer/releases/download/v1.3.5/zscaler-terraformer_1.3.5_windows_386.zip'
$checksum32bit = '4d9ea04cd83bf1eeda97d199fe0d65d63f9b2d565e09dd3c6a245ee0c83a6a96'

# Download, verify, and unzip the package
$packageArgs = @{
    packageName    = $packageName
    unzipLocation  = $toolsDir
    url            = $url32bit  # Default to 32-bit
    checksum       = $checksum32bit
    checksumType   = 'sha256'
    url64bit       = $url64bit  # Use this for 64-bit systems
    checksum64     = $checksum64bit
    checksumType64 = 'sha256'
}

Install-ChocolateyZipPackage @packageArgs
 
