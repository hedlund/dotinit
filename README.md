# dotinit

Just my installation & configuration scripts, to be used together with my [dotfiles](https://github.com/hedlund/dotfiles).

## Windows

To install on Windows, simply run PowerShell with elevated privileges and execute:

```posh
[Net.ServicePointManager]::SecurityProtocol = [Net.SecurityProtocolType]::Tls12
Invoke-WebRequest -Uri https://github.com/hedlund/dotinit/archive/master.zip -OutFile dotinit.zip
Expand-Archive -Path dotinit.zip
cd dotinit/dotinit-master
./init-win.ps1
```
