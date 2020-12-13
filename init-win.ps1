#Requires -RunAsAdministrator

$DotInitDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent

# Include install.ps1 to install all the softwares
. ("$DotInitDirectory\windows\install.ps1")

# Include install-code.ps1 to install some Visual Studio Code extensions
. ("$DotInitDirectory\windows\install-code.ps1")

# Include configure.ps1 to configure the registry
. ("$DotInitDirectory\windows\configure.ps1")

# Include configure-apps.ps1 to configure a couple of the installed apps
. ("$DotInitDirectory\windows\configure-apps.ps1")

# Include configure-autostart.ps1 to fix autostart items
. ("$DotInitDirectory\windows\configure-autostart.ps1")

# Include cleanup.ps1 to cleanup some things
. ("$DotInitDirectory\windows\cleanup.ps1")

# Enable WSL, Hyper-V & containers
Enable-WindowsOptionalFeature -Online -FeatureName VirtualMachinePlatform -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Windows-Subsystem-Linux -NoRestart
# TODO: Do we still need these two?
Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All -NoRestart
Enable-WindowsOptionalFeature -Online -FeatureName containers -All -NoRestart

# Make sure we use WSL2 by default
wsl --set-default-version 2

# Rename the PC
$name = Read-Host -Prompt "Enter new name to rename the computer (ENTER to skip)"
if ($name.Trim()) {
    $computer = Get-WmiObject Win32_ComputerSystem
    $computer.Rename($name.Trim())
}

Write-Output "`nYour Windows PC has been initiated.`nPlease restart it to apply all changes!`n"
