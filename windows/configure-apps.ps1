#Requires -RunAsAdministrator
param (
    [switch]$DryRun = $false
)
$Global:DryRun = $DryRun

. ("$PSScriptRoot\functions.ps1")
