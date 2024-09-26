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
$url64bit = 'https://github.com/zscaler/zscaler-terraformer/releases/download/v1.3.3/zscaler-terraformer_1.3.3_windows_amd64.zip'
$checksum64bit = 'd0212769cbfe88b50703274aeec2b45e14cd9a49746b4bc2d0ed0b3ec84aa8ea'

# URL and checksum for the 32-bit .zip file
$url32bit = 'https://github.com/zscaler/zscaler-terraformer/releases/download/v1.3.3/zscaler-terraformer_1.3.3_windows_386.zip'
$checksum32bit = 'e6f76af7cc09a0d36abab13cde29e74764f003bbd124b54e1b0f5bbfd83dd1d2'

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
 
