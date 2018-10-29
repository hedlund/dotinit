#Requires -RunAsAdministrator

$ScriptDirectory = Split-Path -Path $MyInvocation.MyCommand.Definition -Parent
. ("$ScriptDirectory\functions.ps1")

# In order to install Scoop and Choco, we must set the execution policy to 
# allow to run remote scripts
if ((Get-ExecutionPolicy) -eq "Restricted") {
    Set-ExecutionPolicy RemoteSigned -scope CurrentUser
}

###############################################################################
# Configuration

$TOOLS_DIR = "C:\tools"
$WEASEL_PAGEANT_VERSION = "1.1"
$SCOOP_DIR = "$HOME\scoop"

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

# Install most tools using Scoop
scoop install autohotkey
scoop install cmder
scoop install docker
scoop install firefox-developer
scoop install godot
scoop install gpg4win
scoop install hyper
scoop install mobaxterm
scoop install now-cli
scoop install postman
scoop install slack
scoop install sudo ln touch time
scoop install vscode
scoop install wox
scoop install zeal

# Add Visual Studio Code to context menu
reg import "$SCOOP_DIR\apps\vscode\current\vscode-install-context.reg"

# Make sure Git recognises OpenSSH
[environment]::SetEnvironmentVariable('GIT_SSH', (Resolve-Path (scoop which ssh)), 'USER')


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
choco install -y googlechrome
choco install -y spotify


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
