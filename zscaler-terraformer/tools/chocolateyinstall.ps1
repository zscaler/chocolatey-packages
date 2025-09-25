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

# Use the release version directly (from GitHub tag)
$version = "2.1.0"

# URL and checksum for the 64-bit .zip file
$url64bit = "https://github.com/zscaler/zscaler-terraformer/releases/download/v$version/zscaler-terraformer_$version`_windows_amd64.zip"
$checksum64bit = 'f15ef2b6511f1fd60e8ce707b1d8fdfe82aa13ab119c1b00e086f8e8793f6141'

# URL and checksum for the 32-bit .zip file
$url32bit = "https://github.com/zscaler/zscaler-terraformer/releases/download/v$version/zscaler-terraformer_$version`_windows_386.zip"
$checksum32bit = '83c89c9d662fe1a21659a70a0a249b1675b419ef7b7c75d2b5822c11e30fc754'

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
