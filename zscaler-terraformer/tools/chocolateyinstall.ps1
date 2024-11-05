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
$url64bit = 'https://github.com/zscaler/zscaler-terraformer/releases/download/v1.3.4/zscaler-terraformer_1.3.4_windows_amd64.zip'
$checksum64bit = '6f1bc8d647dc491e15ee305208717f5318ded5067db4ab372225ac7c394ffccf'

# URL and checksum for the 32-bit .zip file
$url32bit = 'https://github.com/zscaler/zscaler-terraformer/releases/download/v1.3.4/zscaler-terraformer_1.3.4_windows_386.zip'
$checksum32bit = 'ef95cc5ede24ef8dc1ac71e9f3e51242786e68f2d2bc3b6aae6e2576d7fc16ec'

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
 
