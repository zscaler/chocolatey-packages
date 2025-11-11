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
$version = "2.1.4"

# URL and checksum for the 64-bit .zip file
$url64bit = "https://github.com/zscaler/zscaler-terraformer/releases/download/v$version/zscaler-terraformer_$version`_windows_amd64.zip"
$checksum64bit = 'feca552e2dcf09fac84508eb4e5986f8870714036a7a375579f68ecf79cb200a'

# URL and checksum for the 32-bit .zip file
$url32bit = "https://github.com/zscaler/zscaler-terraformer/releases/download/v$version/zscaler-terraformer_$version`_windows_386.zip"
$checksum32bit = 'c13487ec8cef4d31306c7af83ed98917fc18cee6f54fa9d4f165ef32cd4867ac'

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
