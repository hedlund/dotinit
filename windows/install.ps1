#Requires -RunAsAdministrator

$ScriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. ("$ScriptDirectory\functions.ps1")

# In order to install Scoop and Choco, we must set the execution policy to 
# allow to run remote scripts
if ((Get-ExecutionPolicy) -eq "Restricted") {
    Set-ExecutionPolicy RemoteSigned -scope CurrentUser -force
}

###############################################################################
# Configuration

$TOOLS_DIR = "C:\tools"
$WEASEL_PAGEANT_VERSION = "1.1"

###############################################################################
# Scoop

if (!(Get-Command "scoop" -errorAction SilentlyContinue)) {
   Invoke-Expression (New-Object Net.WebClient).DownloadString('https://get.scoop.sh')
}

# We need to install git before adding buckets to Scoop...
scoop install openssh git

# ...then add the buckets
scoop bucket add extras
scoop bucket add games
scoop bucket add nerd-fonts

# Install most tools using Scoop
scoop install autohotkey
scoop install cmder
scoop install etcher
scoop install firefox-developer
scoop install godot
scoop install gpg4win
scoop install hain
#scoop install mobaxterm
#scoop install now-cli
scoop install postman
scoop install putty
scoop install slack
scoop install sudo ln touch time

# Make sure SSH works with Git
# Using plink (putty) enables Yubikey to work
[environment]::SetEnvironmentVariable('GIT_SSH', (Resolve-Path (scoop which plink)), 'USER')
#[environment]::SetEnvironmentVariable('GIT_SSH', (Resolve-Path (scoop which ssh)), 'USER')

###############################################################################
# Choco

if (!(Get-Command "choco" -errorAction SilentlyContinue)) {
    Invoke-Expression (New-Object Net.WebClient).DownloadString('https://chocolatey.org/install.ps1')
}

# Install a few applications using Choco
choco install -y 1password
choco install -y boostnote
choco install -y caffeine
choco install -y dropbox
choco install -y docker-for-windows
choco install -y googlechrome
choco install -y hyper
choco install -y lightshot
choco install -y quicklook
choco install -y spotify
#choco install -y vivaldi
choco install -y vscode
choco install -y zeal

# Install fonts
choco install -y firacode

# Installing Ubuntu via choco can't be done until after restart of computer
# (as LXSS must be enabled first), and also it installs the subsystem as root 
# and requires elevated privileges, so skip this for now...
#choco install -y wsl wsl-ubuntu-1804

###############################################################################
# Weasel-Pageant

# Make sure we have a tools directory
New-Item -Force -ItemType directory -Path "$TOOLS_DIR"

# Check if we need to install weasel-pageant
if (![System.IO.File]::Exists("$TOOLS_DIR\weasel-pageant\weasel-pageant")) {

    # Download the release ZIP file...
    $weasel_file = "$TOOLS_DIR\weasel-pageant.zip"
    [Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
    (new-object net.webclient).DownloadFile("https://github.com/vuori/weasel-pageant/releases/download/v$WEASEL_PAGEANT_VERSION/weasel-pageant-$WEASEL_PAGEANT_VERSION.zip", $weasel_file)

    # ...and unzip it and move it into place
    $shell_app=new-object -com shell.application
    $shell_app.namespace($TOOLS_DIR).CopyHere($shell_app.namespace($weasel_file).items())
    Rename-Item -Path "$TOOLS_DIR\weasel-pageant-$WEASEL_PAGEANT_VERSION" -NewName "weasel-pageant" -ErrorAction Stop

    # Cleanup
    Remove-Item -Path "$weasel_file"
}

###############################################################################
# Application configuration

# Configure GPG
$GPG_CONFIG_FILE = "$HOME\AppData\Roaming\gnupg\gpg-agent.conf"
gpg --import "$ScriptDirectory\..\common\pubkey.txt"
if (![System.IO.File]::Exists($GPG_CONFIG_FILE) -Or (Get-Content $GPG_CONFIG_FILE | %{$_ -match "enable-putty-support"}) -contains $false) {
    Add-Content $GPG_CONFIG_FILE "enable-putty-support"
}

# Configure Docker to not automatically start, not track, and expose TCP
# (which is insecure, but unfortunately needed to use with LXSS).
$DOCKER_CONFIG_FILE = "$HOME\AppData\Roaming\Docker\settings.json"
if (![System.IO.File]::Exists($DOCKER_CONFIG_FILE) -Or (Get-Content $DOCKER_CONFIG_FILE) -eq $null) {
    @{StartAtLogin=$false;IsTracking=$false;ExposeTcp=$true} | ConvertTo-Json | Out-File $DOCKER_CONFIG_FILE
}
else {
    (Get-Content $DOCKER_CONFIG_FILE) `
        -replace '"StartAtLogin":.+$', '"StartAtLogin": false,' `
        -replace '"IsTracking":.+$', '"IsTracking": false,' `
        -replace '"ExposeTcp":.+$', '"ExposeTcp": true,' |
      Out-File $DOCKER_CONFIG_FILE
}

# Make sure that Git isn't messing with the line endings
git config --global core.autocrlf false


###############################################################################
# Common folders

New-Item -ItemType Directory -Force -Path "$HOME\Projects" | Out-Null
New-Item -ItemType Directory -Force -Path "$HOME\Temp" | Out-Null
