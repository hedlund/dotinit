#Requires -RunAsAdministrator

$ScriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. ("$ScriptDirectory\functions.ps1")


###############################################################################
# Uninstall some Windows Store crap

Write-Output "Uninstalling some Windows Store crap..."

Get-AppxPackage A278AB0D.* | Remove-AppxPackage
Get-AppxPackage king.com.* | Remove-AppxPackage
Get-AppxPackage Microsoft.MicrosoftSolitaireCollection* | Remove-AppxPackage
Get-AppxPackage Microsoft.MicrosoftOfficeHub* | Remove-AppxPackage
Get-AppxPackage 828B5831.HiddenCity* | Remove-AppxPackage
Get-AppxPackage 7EE7776C.LinkedInforWindows | Remove-AppxPackage
Get-AppxPackage Fitbit.* | Remove-AppxPackage
Get-AppxPackage Microsoft.People | Remove-AppxPackage

# Prevent "Suggested Applications" from returning
Set-RegistryDWord -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\Cloud Content" -Name "DisableWindowsConsumerFeatures" -Value 1


###############################################################################
# Remove OneDrive

Write-Output "Removing OnDrive..."

# Kill the OneDrive and Explorer processes
taskkill.exe /F /IM "OneDrive.exe"
taskkill.exe /F /IM "explorer.exe"

# Run the OneDrive uninstall if it exists
if (Test-Path "$env:systemroot\SysWOW64\OneDriveSetup.exe") {
    & "$env:systemroot\SysWOW64\OneDriveSetup.exe" /uninstall
}

# Cleanup some remaining folders and files
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:localappdata\Microsoft\OneDrive"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "$env:programdata\Microsoft OneDrive"
Remove-Item -Recurse -Force -ErrorAction SilentlyContinue "C:\OneDriveTemp"
Remove-Item -Force -ErrorAction SilentlyContinue "$env:userprofile\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\OneDrive.lnk"

# Remove from Explorer sidebar
New-PSDrive -PSProvider "Registry" -Root "HKEY_CLASSES_ROOT" -Name "HKCR"
Set-RegistryDWord -Path "HKCR:\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" -Name "System.IsPinnedToNameSpaceTree" -Value 0
Set-RegistryDWord -Path "HKCR:\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}" -Name "System.IsPinnedToNameSpaceTree" -Value 0
Remove-PSDrive "HKCR"

# Restart Explorer and give it time to start
start "explorer.exe"
sleep 15
