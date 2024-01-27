# PowerShell Command Library for Active Directory

## Basics

### [Install Features](https://learn.microsoft.com/en-us/powershell/module/servermanager/install-windowsfeature?view=windowsserver2022-ps)
 - Installs one or more roles, role services, or features on either the local or a specified remote server that is running Windows Server.
 
 - Syntax: 
   Install-WindowsFeature -Name [Feature/Role Name] -IncludeManagementTools
   
 - Example: 
```powershell
    Install-WindowsFeature -Name ADDSForest -IncludeManagementTools
```
