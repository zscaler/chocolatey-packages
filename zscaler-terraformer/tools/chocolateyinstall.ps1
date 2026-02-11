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
$version = "2.1.9"

# URL and checksum for the 64-bit .zip file
$url64bit = "https://github.com/zscaler/zscaler-terraformer/releases/download/v$version/zscaler-terraformer_$version`_windows_amd64.zip"
$checksum64bit = 'fbacaad89d4ad2fda33cdbe2ec19e426beb2e5b363f71a6fa050509942373ce7'

# URL and checksum for the 32-bit .zip file
$url32bit = "https://github.com/zscaler/zscaler-terraformer/releases/download/v$version/zscaler-terraformer_$version`_windows_386.zip"
$checksum32bit = 'b877b8428ec2869b2a0d5bd4d2638515a4ab4a14b5d359e64500c63d597635b1'

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
