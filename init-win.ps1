#Requires -RunAsAdministrator

$DotInitDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

# Include install.ps1 to install all the softwares
. ("$DotInitDirectory\windows\install.ps1")

# Include configure.ps1 to configure the registry
. ("$DotInitDirectory\windows\configure.ps1")

# Include cleanup.ps1 to cleanup some things
. ("$DotInitDirectory\windows\cleanup.ps1")

# Enable LXSS, Hyper-V & containers
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux  -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All  -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName containers -All -NoRestart

Write-Output "`nYour Windows PC has been initiated.`nPlease restart it to apply all changes!`n"
