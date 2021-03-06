#Requires -RunAsAdministrator

$ScriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. ("$ScriptDirectory\functions.ps1")

# In order to install Scoop and Choco, we must set the execution policy to
# allow to run remote scripts
if ((Get-ExecutionPolicy) -eq "Restricted") {
    Set-ExecutionPolicy RemoteSigned -scope CurrentUser -force
}

###############################################################################
# Scoop

if (!(Get-Command "scoop" -errorAction SilentlyContinue)) {
    Invoke-Expression (New-Object Net.WebClient).DownloadString('https://get.scoop.sh')
}

# We need to install git before adding buckets to Scoop...
scoop install openssh git

# ...then add the buckets
scoop bucket add extras
scoop bucket add nerd-fonts

# Install some additional tools using Scoop
scoop install gpg4win
scoop install putty
scoop install sudo ln touch time
scoop install task

#scoop install autohotkey
#scoop install cmder
#scoop install hain
#scoop install mobaxterm
#scoop install now-cli
#scoop install postman

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
#TODO: at the time of writing this, 1password has been broken in choco for months...
choco install -y 1password
choco install -y AndroidStudio
choco install -y caffeine
choco install -y docker-desktop
choco install -y etcher
choco install -y firefox
choco install -y gh
choco install -y godot
choco install -y golang
choco install -y GoogleChrome
choco install -y microsoft-windows-terminal
#choco install -y intel-xtu
choco install -y lightshot
choco install -y powertoys
choco install -y quicklook
choco install -y spotify
#choco install -y tunsafe
choco install -y vagrant
choco install -y vivaldi
choco install -y vscode
#choco install -y wincrypt-sshagent

# greenshot may be an alternative to lightshot
# seer may be an alternative to quicklook

# Install the Vagrant SCP plugin
vagrant plugin install vagrant-scp

# Install fonts
choco install -y FiraCode

# Installing Ubuntu via choco can't be done until after restart of computer
# (as LXSS must be enabled first), and also it installs the subsystem as root
# and requires elevated privileges, so skip this for now...
#choco install -y wsl wsl-ubuntu-1804

###############################################################################
# Application configuration

# Configure GPG
$GPG_CONFIG_FILE = "$HOME\AppData\Roaming\gnupg\gpg-agent.conf"
gpg --import "$ScriptDirectory\..\common\pubkey.txt"
if (![System.IO.File]::Exists($GPG_CONFIG_FILE) -Or (Get-Content $GPG_CONFIG_FILE | % { $_ -match "enable-putty-support" }) -contains $false) {
    Add-Content $GPG_CONFIG_FILE "enable-putty-support"
}

# Configure Docker to not automatically start, not track, NOT expose TCP, and use WSL2 by default.
$DOCKER_CONFIG_FILE = "$HOME\AppData\Roaming\Docker\settings.json"
if (![System.IO.File]::Exists($DOCKER_CONFIG_FILE) -Or (Get-Content $DOCKER_CONFIG_FILE) -eq $null) {
    @{autoStart = $false; analyticsEnabled = $false } | ConvertTo-Json | Out-File $DOCKER_CONFIG_FILE
}
else {
    (Get-Content $DOCKER_CONFIG_FILE) `
        -replace '"autoStart":.+$', '"autoStart": false,' `
        -replace '"analyticsEnabled":.+$', '"analyticsEnabled": false,' |
    Out-File $DOCKER_CONFIG_FILE
}

# Make sure that Git isn't messing with the line endings
git config --global core.autocrlf false


###############################################################################
# Common folders

New-Item -ItemType Directory -Force -Path "$HOME\Projects" | Out-Null
New-Item -ItemType Directory -Force -Path "$HOME\Temp" | Out-Null
