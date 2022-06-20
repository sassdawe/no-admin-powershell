<# no-admin-powershell

Tips and tricks for when you don't have local admin rights 

> First presented at [PowerShell Conference Europe 2022](https://psconf.eu)
#>

## Opening PowerShell

<#
  When you are on Windows you do NOT need to install anything to get it started.
  Just search for ISE in the Start menu to show find `Windows PowerShell ISE`.
  ISE stands for Integrated Scripting Environment
  
  ISE is perfectly enough!
#>

## Profile file

Write-Host $profile

Test-Path $profile

New-Item $profile -ItemType File

New-Item $profile -ItemType File -Force

## Execution Policy

Get-ExecutionPolicy

Set-ExecutionPolicy -ExecutionPolicy Bypass

Set-ExecutionPolicy -ExecutionPolicy Bypass -Scope CurrentUser

## Error message color

<# As others have already said it, color red is bad, so use something nicer #>

$host.PrivateData.ErrorForegroundColor = 'Green'

## Save first instead of installing

Find-Module Pester

## Help system

Get-Help Get-Help

## Important commands

Get-Help
Get-Member
Get-Content
Test-Path
New-Item
Invoke-WebRequest
Foreach-Object
Where-Object
Select-Object
Sort-Object

$ProgressPreference = 'SilentlyContinue'

## Credit

<#
Influenced by **Mike F Robbins**

[http://mikefrobbins.com](http://mikefrobbins.com)

[PowerShell 101: The No-Nonsense Beginner’s Guide to PowerShell](https://github.com/mikefrobbins/Presentations/blob/main/PowerShell%20on%20the%20River%202019/PowerShell%20101/PowerShell%20101.ps1)
#>