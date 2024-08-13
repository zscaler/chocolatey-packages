<#
.SYNOPSIS
Uninstalls the Zscaler Terraformer CLI.

Authors: Zscaler Technology Alliances <devrel@zscaler.com>

.DESCRIPTION
This script uninstalls the Zscaler Terraformer Command Line Interface and removes related files.

#>

$ErrorActionPreference = 'Stop'

$toolsDir = Split-Path $MyInvocation.MyCommand.Definition

# Remove all files in the tools directory
if (Test-Path $toolsDir) {
    Remove-Item -Recurse -Force $toolsDir
}
