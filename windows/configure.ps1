#Requires -RunAsAdministrator
param (
    [switch]$DryRun = $false
)
$Global:DryRun = $DryRun

$ScriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. ("$ScriptDirectory\functions.ps1")


###############################################################################
# Privacy / General

Write-Output "Configuring general privacy..."

# Disable Allow apps to use advertising ID to make ads more interesting to you...
Set-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\AdvertisingInfo" -Name Enabled -Value 0

# Disable Allow websites to provide locally relevant content by accessing my language list
Set-RegistryDWord -Path "HKCU:\Control Panel\International\User Profile" -Name HttpAcceptLanguageOptOut -Value 1

# Disable Allow Windows to track app launches to improve Start and search results
Set-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" -Name Start_TrackProgs -Value 0


###############################################################################
# Privacy / Speech, inking & typing

Write-Output "Configuring speech, inking & typing..."

# Turn off speech services and typing suggestions
Set-RegistryDWord -Path "HKCU:\Software\Microsoft\InputPersonalization" -Name RestrictImplicitInkCollection -Value 1
Set-RegistryDWord -Path "HKCU:\SOFTWARE\Microsoft\InputPersonalization" -Name RestrictImplicitTextCollection -Value 1
Set-RegistryDWord -Path "HKCU:\Software\Microsoft\InputPersonalization\TrainedDataStore" -Name HarvestContacts -Value 0
Set-RegistryDWord -Path "HKCU:\Software\Microsoft\Personalization\Settings" -Name AcceptedPrivacyPolicy -Value 0


###############################################################################
# Privacy / Diagnostic & feedback

Write-Output "Configuring diagnostics & feedback..."

# Set Diagnostic data to Basic
Set-RegistryDWord -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" -Name AllowTelemetry -Value 1

# Disable Improve inking & typing recognition
Set-RegistryDWord -Path "HKCU:\Software\Microsoft\Input\TIPC" -Name Enabled -Value 0

# Disable Tailored experiences
Set-RegistryDWord -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Privacy" -Name TailoredExperiencesWithDiagnosticDataEnabled -Value 0

# Disable Diagnostic data viewer
Set-RegistryDWord -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Diagnostics\DiagTrack\EventTranscriptKey" -Name EnableEventTranscript -Value 0


###############################################################################
# Edge

Write-Output "Configuring Edge..."

[string]$EdgeKey = "HKCU:\Software\Classes\Local Settings\Software\Microsoft\Windows\CurrentVersion\AppContainer\Storage\microsoft.microsoftedge_8wekyb3d8bbwe\MicrosoftEdge"

# Set dark theme
Set-RegistryDWord -Path "$EdgeKey\Main" -Name Theme -Value 1

# Send Do Not Track requests
Set-RegistryDWord -Path "$EdgeKey\Main" -Name DoNotTrack -Value 1

# Do not save passwords
Set-RegistryString -Path "$EdgeKey\Main" -Name "FormSuggest Passwords" -Value "no"

# Do not save cards
Set-RegistryString -Path "$EdgeKey\Main" -Name UsePaymentFormFill -Value "no"

# Do not bug me about default browser
Set-RegistryDWord -Path "$EdgeKey\Main" -Name DisallowDefaultBrowserPrompt -Value 1

# Disable search suggestions
Set-RegistryDWord -Path "$EdgeKey\User\Default\SearchScopes" -Name ShowSearchSuggestionsGlobal -Value 0

# Disable page prediction
Set-RegistryDWord -Path "$EdgeKey\FlipAhead" -Name FPEnabled -Value 0

# Enable phising filter
Set-RegistryDWord -Path "$EdgeKey\PhishingFilter" -Name EnabledV9 -Value 1


###############################################################################
# Misc privacy settings

Write-Output "Configuring remaining privacy settings..."

# Disable Wifi Sense
Set-RegistryDWord -Path "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\config" -Name AutoConnectAllowedOEM  -Value 0
Set-RegistryDWord -Path "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\features" -Name WiFiSenseCredShared -Value 0
Set-RegistryDWord -Path "HKLM:\SOFTWARE\Microsoft\WcmSvc\wifinetworkmanager\features" -Name WiFiSenseOpen -Value 0

# Disable Share updates
Set-RegistryDWord -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" -Name DODownloadMode -Value 0

# Disable Telemetry service
Disable-Service -Name DiagTrack
Disable-Service -Name dmwappushservice
Set-RegistryDWord -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\DataCollection" -Name AllowTelemetry -Value 0


###############################################################################
# Screen saver

Write-Output "Configuring screen saver..."

# Set a 3 minute timeout and require password
Set-RegistryDWord -Path "HKCU:\Control Panel\Desktop" -Name "ScreenSaveActive" -Value 1
Set-RegistryDWord -Path "HKCU:\Control Panel\Desktop" -Name "ScreenSaverIsSecure" -Value 1
Set-RegistryDWord -Path "HKCU:\Control Panel\Desktop" -Name "ScreenSaveTimeOut" -Value 180
Set-RegistryString -Path "HKCU:\Control Panel\Desktop" -Name "SCRNSAVE.EXE" -Value "C:\Windows\system32\scrnsave.scr"

# Set a 5 second grace period
Set-RegistryDWord -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "ScreenSaverGracePeriod" -Value 5

###############################################################################
# Keyboard

Write-Output "Configuring keyboard..."

# Disable the keyboard layout switching shortcut
Set-RegistryString -Path "HKCU:\Keyboard Layout\Toggle" -Name "Language Hotkey" -Value "3"
Set-RegistryString -Path "HKCU:\Keyboard Layout\Toggle" -Name "Hotkey" -Value "3"
Set-RegistryString -Path "HKCU:\Keyboard Layout\Toggle" -Name "Layout Hotkey" -Value "3"


###############################################################################
# Window title bars should be black

Write-Output "Configuring Window Title Bars..."

Set-RegistryDWord -Path "HKCU:\SOFTWARE\Microsoft\Windows\DWM" -Name "ColorPrevalence" -Value 1
Set-RegistryDWord -Path "HKCU:\SOFTWARE\Microsoft\Windows\DWM" -Name "AccentColor" -Value 0xff000000
Set-RegistryDWord -Path "HKCU:\SOFTWARE\Microsoft\Windows\DWM" -Name "AccentColorInactive" -Value 0xff666666
