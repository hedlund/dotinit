# As we most likely do not have bash available (yet) at the point of running this script,
# let's simply parse the install-code.sh script and extract the lines installing something.

$extensions = Get-Content "$PSScriptRoot\..\common\install-code.sh" | Select-String -Pattern "^\s*[^#]code --install-extension (.*)$" | %{ $_.Matches.Groups[1].Value }
foreach ($extension in $extensions) {
  code --install-extension $extension
}

# This is an extension specific to the Windows environment
code --install-extension ms-vscode-remote.remote-wsl
