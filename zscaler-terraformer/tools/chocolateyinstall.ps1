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
$url64bit = 'https://github.com/zscaler/zscaler-terraformer/releases/download/v2.0.15/zscaler-terraformer_2.0.15_windows_amd64.zip'
$checksum64bit = 'd2c2bd950f76cc45a59c97def390e707b0e566f3f0f1b1831ccf0096fc67880e'

# URL and checksum for the 32-bit .zip file
$url32bit = 'https://github.com/zscaler/zscaler-terraformer/releases/download/v2.0.15/zscaler-terraformer_2.0.15_windows_386.zip'
$checksum32bit = '0077aa5d1a495e1d7ff6f7aaf71757ce9aa5610aab2325005833c7ccee876410'

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
 
