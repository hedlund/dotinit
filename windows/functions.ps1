Function Test-RegistryValue([String]$Path, [String]$Name) {

    if (Test-Path $Path) {
        $Key = Get-Item -LiteralPath $Path
        if ($Key.GetValue($Name, $null) -ne $null) {
            return $true
        }
    }
    return $false
}

Function Get-RegistryValue([String]$Path, [String]$Name) {

    if (Test-Path $Path) {
        $Key = Get-Item -LiteralPath $Path
        if ($Key.GetValue($Name, $null) -ne $null) {
            return $Key.GetValue($Name, $null)
        }
    }
    return $null
}

Function Add-RegistryKey([string]$Path) {

    if (!(Test-Path $Path)) {
        $parent = "$Path\.."

        $grandParent = "$parent\.."
        if (!(Test-Path $grandParent)) {
            New-Item -Path $grandParent | Out-Null
        }

        if (!(Test-Path $parent)) {
            New-Item -Path $parent | Out-Null
        }

        New-Item -Path $Path | Out-Null
    }
}

Function Set-RegistryDWord([String]$Path, [String]$Name, [int32]$Value) {

    $old = Get-RegistryValue -Path $Path -Name $Name
    if ($old -ne $null -and [int32]$old -eq $Value) {
        # Already the correct value...
        return
    }

    if (Test-RegistryValue $Path $Name) {
        Set-ItemProperty -Path $Path -Name $Name -Value $Value
    } else {
        Add-RegistryKey -Path $Path
        New-ItemProperty -Path $Path -Name $Name -PropertyType DWord -Value $Value | Out-Null
    }
}

Function Set-RegistryString([String]$Path, [String]$Name, [string]$Value){

    $old = Get-RegistryValue -Path $Path -Name $Name
    if ($old -ne $null -and [string]$old -eq $Value) {
        # Already the correct value...
        return
    }

    if (Test-RegistryValue $Path $Name) {
        Set-ItemProperty -Path $Path -Name $Name -Value $Value
    } else {
        Add-RegistryKey -Path $Path
        New-ItemProperty -Path $Path -Name $Name -PropertyType String -Value $Value | Out-Null
    }
}

Function Set-DeviceAccess([string]$Guid, [string]$Value){
    Set-RegistryString -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\DeviceAccess\Global\{$Guid}" -Name Value -Value $Value
}

Function Set-ShortCut([String]$Source, [String]$Arguments, [String]$Destination) {
    $WshShell = New-Object -comObject WScript.Shell
    $Shortcut = $WshShell.CreateShortcut($Destination)
    $Shortcut.TargetPath = $Source
    $Shortcut.Arguments = $Arguments
    $Shortcut.Save()
}
