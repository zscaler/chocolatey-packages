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
$version = "2.1.6"

# URL and checksum for the 64-bit .zip file
$url64bit = "https://github.com/zscaler/zscaler-terraformer/releases/download/v$version/zscaler-terraformer_$version`_windows_amd64.zip"
$checksum64bit = '4d868afd7c61b01cb6dfa41b6e2270d9a3639e6acd32a90e852ae63012979b7c'

# URL and checksum for the 32-bit .zip file
$url32bit = "https://github.com/zscaler/zscaler-terraformer/releases/download/v$version/zscaler-terraformer_$version`_windows_386.zip"
$checksum32bit = '84f1b9f2fe8733be7dc3c8a293c2f039464f297b1cf085c35da27eeecba8e9f3'

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
