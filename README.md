# PowerShell Command Library for Active Directory

## Basics

 ### [Get Help on Any Command](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/get-help?view=powershell-7.4)
  - Displays information about PowerShell commands and concepts.

 - Syntax: 
   Get-Help [Cmdlet]
   
 - Example: 
```powershell
    Get-Help Write-Host
```


## Server Role and Features

### [Install Features](https://learn.microsoft.com/en-us/powershell/module/servermanager/install-windowsfeature?view=windowsserver2022-ps)
 - Installs one or more roles, role services, or features on either the local or a specified remote server that is running Windows Server.
 
 - Syntax: 
   Install-WindowsFeature -Name [Feature/Role Name] -IncludeManagementTools
   
 - Example: 
```powershell
    Install-WindowsFeature -Name ADDSForest -IncludeManagementTools
```
### [Import Modules](https://learn.microsoft.com/en-us/powershell/module/microsoft.powershell.core/import-module?view=powershell-7.4)
 - Adds modules to the current session.
 
 - Syntax: 
   Import-Module [ModuleName]
   
 - Example: 
```powershell
    Import-Module DnsServer
```
