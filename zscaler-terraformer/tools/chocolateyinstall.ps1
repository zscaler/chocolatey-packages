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
$version = "2.1.19"

# URL and checksum for the 64-bit .zip file
$url64bit = "https://github.com/zscaler/zscaler-terraformer/releases/download/v$version/zscaler-terraformer_$version`_windows_amd64.zip"
$checksum64bit = '0795d4296e5146bb6fdabf7f0bd2ee4f810613acfc04ecec80a27217d03de7f8'

# URL and checksum for the 32-bit .zip file
$url32bit = "https://github.com/zscaler/zscaler-terraformer/releases/download/v$version/zscaler-terraformer_$version`_windows_386.zip"
$checksum32bit = '91b44b7b6232831b8567e633426e98a3dbc8e4945bd9b28ca5bb926960404b8b'

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
