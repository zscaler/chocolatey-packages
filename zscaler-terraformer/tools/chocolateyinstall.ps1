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
$url64bit = 'https://github.com/zscaler/zscaler-terraformer/releases/download/v2.0.10/zscaler-terraformer_2.0.10_windows_amd64.zip'
$checksum64bit = '671020b38ec02feb059d8f0638c1ed48df0dc8ae751cfb4f5793cf39ac4df381'

# URL and checksum for the 32-bit .zip file
$url32bit = 'https://github.com/zscaler/zscaler-terraformer/releases/download/v2.0.10/zscaler-terraformer_2.0.10_windows_386.zip'
$checksum32bit = '197c969382661dc1997ce099d86c61d7b8e1d5a127ab8bf557042cdc9335c67a'

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
 
