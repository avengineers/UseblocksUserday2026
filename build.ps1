<#
.DESCRIPTION
    Wrapper for installing the dependencies of the slide decks

.Notes
On Windows, it may be required to call this script with the proper execution policy.
You can do this by issuing the following PowerShell command:

PS C:\> powershell -ExecutionPolicy Bypass -File .\build.ps1 -install

For more information on Execution Policies:
https://go.microsoft.com/fwlink/?LinkID=135170
#>

param(
    [Parameter(Mandatory = $false, HelpMessage = 'Clean install, wipe out node_modules first. (Switch, default: false)')]
    [switch]$clean = $false,
    [Parameter(Mandatory = $false, HelpMessage = 'Install all dependencies required to view the slides. (Switch, default: false)')]
    [switch]$install = $false
)

function Invoke-Bootstrap {
    # Download bootstrap scripts from external repository
    Invoke-RestMethod -Uri https://raw.githubusercontent.com/avengineers/bootstrap-installer/v1.19.1/install.ps1 | Invoke-Expression
    # Execute bootstrap script
    . .\.bootstrap\bootstrap.ps1
}

function Remove-Path {
    param (
        [Parameter(Mandatory = $true, Position = 0)]
        [string]$path
    )
    if (Test-Path -Path $path -PathType Container) {
        Write-Output "Deleting directory '$path' ..."
        Remove-Item $path -Force -Recurse
    }
    elseif (Test-Path -Path $path -PathType Leaf) {
        Write-Output "Deleting file '$path' ..."
        Remove-Item $path -Force
    }
}

## start of script
# Always set the $InformationPreference variable to "Continue" globally,
# this way it gets printed on execution and continues execution afterwards.
$InformationPreference = "Continue"

# Stop on first error
$ErrorActionPreference = "Stop"

Push-Location $PSScriptRoot
Write-Output "Running in ${pwd}"

try {
    if ($clean) {
        Remove-Path "node_modules"
    }

    if ($install) {
        # bootstrap environment (installs nodejs from scoopfile.json)
        Invoke-Bootstrap
        npm install
    }
}
finally {
    Pop-Location
}
## end of script
