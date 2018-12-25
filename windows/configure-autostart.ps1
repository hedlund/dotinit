#Requires -RunAsAdministrator

$ScriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. ("$ScriptDirectory\functions.ps1")


###############################################################################
# Functions

Function Remove-AllExcept([String]$Path, [String[]]$Keep) {
  Get-Item -Path $Path | Select-Object -ExpandProperty property | ForEach-Object {
    if (!($Keep -contains $_)) {
      echo "Removing startup item from registry: $_"
      Remove-ItemProperty -Path $Path -Name $_
    }
  }
}

Function Ensure-StartItems([String]$Path, [Hashtable]$Items) {
  $Items.Keys | Foreach-Object {
    # Only actually set the value if it doesn't already exists...
    if (!(Test-RegistryValue -Path $Path -Name $_)) {
      New-ItemProperty -Path $Path -Name $_ -PropertyType String -Value $Items.$_ | Out-Null
    }
  }
}

Function Fix-RegistryStartItems([String]$Path, [Hashtable]$Items) {
  Remove-AllExcept -Path $Path -Keep $Items.Keys
  Ensure-StartItems -Path $Path -Items $Items
}


###############################################################################
# Registry: Local Machine start items

Fix-RegistryStartItems -Path "HKLM:\SOFTWARE\WOW6432Node\Microsoft\Windows\CurrentVersion\Run" -Items @{
  Dropbox = "`"C:\Program Files (x86)\Dropbox\Client\Dropbox.exe`" /systemstartup";
  Lightshot = "C:\Program Files (x86)\Skillbrains\lightshot\Lightshot.exe"
}


###############################################################################
# Registry: Current User start items

Fix-RegistryStartItems -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Run" -Items @{
  Hain = $(scoop which hain) -replace "~",$HOME
}


###############################################################################
# Start Menu Startup apps

$AllowedStartupItems = @("QuickLook.lnk")
$StartupPath = "$HOME\AppData\Roaming\Microsoft\Windows\Start Menu\Programs\Startup"

# Remove all unspecified...
Get-ChildItem "$StartupPath" -Filter *.lnk | Foreach-Object {
  if (!($AllowedStartupItems -contains $_.Name)) {
    echo "Removing startup item from Start Menu: $($_.Name)"
    Remove-Item -Path $_.FullName
  }
}

# ...and set the ones we actually want
Set-ShortCut -Source "$HOME\AppData\Local\Programs\QuickLook\QuickLook.exe" -Arguments "/autorun" -Destination "$StartupPath\QuickLook.lnk"
