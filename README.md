# no-admin-powershell

Tips and tricks for when we don't have local admin rights 

![image](https://user-images.githubusercontent.com/10754765/174748062-d4310117-eca8-4bc4-bd2e-2ba1aea7f7de.png)

> First presented at [PowerShell Conference Europe 2022](https://psconf.eu)

## Opening PowerShell

When we are on Windows we don't need to install anything to get it started.
Just search for/type `ISE` into the Start menu to find `Windows PowerShell ISE`.
ISE stands for Integrated Scripting Environment

ISE is perfectly enough!

## Profile file

The `$profile` file will get executed every time when we start PowerShell, so this is where we can constomize our experience. (But it does not exists by default)

```PowerShell
Write-Host $profile

Test-Path $profile

New-Item $profile -ItemType File

New-Item $profile -ItemType File -Force
```

Let's try it!

## Execution Policy

Execution policy in PowerShell is like something eveyone runs into and turns off...

```PowerShell
Get-ExecutionPolicy

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned

# Try scoping it to us

Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# if RemoteSigned does not work, just use Bypass

Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser

```

## Error message color

As others have already said it, color red is bad, so let's use something nicer 

```PowerShell
$host.PrivateData.ErrorForegroundColor = 'Green'

# and try it
1/0
```

Also, save this into our profile, because this is not a persistent setting.

## PowerShell Gallery

The PowerShell Gallery is from where we can get the goodies, like QR code generator

```PowerShell
Find-Module QRCodeGenerator
Find-Module QR*

Install-Module QRCodeGenerator

Install-Module QRCodeGenerator -Scope CurrentUser

```

## Help system

PowerShell has the most awesome extensible help system

```PowerShell
Get-Help
```

But sadly by default it comes empty, and we need to download the help **with admin rights** so here we need to ask help from our - hopefully - friendly neighbourhood IT admin, or help desk person to run this command as a local admin on our machine

```PowerShell
Update-Help -Force -ErrorAction SilentlyContinue
```

So we can use `Get-Help` without any errors.

## Important commands

```PowerShell
Get-Help

Get-Member

Get-Command

Get-Command Get-*

Get-Command Set-*

Get-Command *-Computer
```

## Also add these to our profile

```PowerShell
$ProgressPreference = 'SilentlyContinue'
$PSDefaultParameterValues["Install-Module:Scope"] = "CurrentUser"
```
## Credit

Influenced by **Mike F Robbins**

[http://mikefrobbins.com](http://mikefrobbins.com)

[PowerShell 101: The No-Nonsense Beginner’s Guide to PowerShell](https://github.com/mikefrobbins/Presentations/blob/main/PowerShell%20on%20the%20River%202019/PowerShell%20101/PowerShell%20101.ps1)

And also by **Chrissy LeMaire**'s [Tweet](https://twitter.com/cl/status/1446446992633237508)
