#Requires -RunAsAdministrator

. ("$PSScriptRoot\functions.ps1")

###############################################################################
# Zeal

Set-RegistryString -Path "HKCU:\Software\Zeal\Zeal" -Name "check_for_update" -Value "true"
Set-RegistryString -Path "HKCU:\Software\Zeal\Zeal" -Name "hide_on_close" -Value "true"
Set-RegistryString -Path "HKCU:\Software\Zeal\Zeal" -Name "minimize_to_systray" -Value "true"
Set-RegistryString -Path "HKCU:\Software\Zeal\Zeal" -Name "show_systray_icon" -Value "true"
Set-RegistryString -Path "HKCU:\Software\Zeal\Zeal" -Name "start_minimized" -Value "true"
Set-RegistryString -Path "HKCU:\Software\Zeal\Zeal\content" -Name "dark_mode" -Value "true"
Set-RegistryString -Path "HKCU:\Software\Zeal\Zeal\docsets" -Name "path" -Value "$HOME\Dropbox\Library\Zeal\docsets"
