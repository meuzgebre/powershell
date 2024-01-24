# PowerShell Command Library for Active Directory

## User Management

### [Get-ADUser](https://docs.microsoft.com/en-us/powershell/module/addsadministration/get-aduser)
Retrieves one or more Active Directory users.

Example: 
```powershell
Get-ADUser -Filter {Name -like "John*"}
```

### [New-ADUser](https://docs.microsoft.com/en-us/powershell/module/addsadministration/new-aduser)
Creates a new Active Directory user.

Example: 
```powershell
New-ADUser -SamAccountName jdoe -GivenName John -Surname Doe -UserPrincipalName jdoe@domain.com
```

### [Set-ADUser](https://docs.microsoft.com/en-us/powershell/module/addsadministration/set-aduser)
Modifies properties of an Active Directory user.

Example: 
```powershell
Set-ADUser -Identity jdoe -Title "Manager"
```

### [Remove-ADUser](https://docs.microsoft.com/en-us/powershell/module/addsadministration/remove-aduser)
Deletes an Active Directory user.

Example: 
```powershell
Remove-ADUser -Identity jdoe -Confirm:$false
```

## Group Management

### [Get-ADGroup](https://docs.microsoft.com/en-us/powershell/module/addsadministration/get-adgroup)
Retrieves one or more Active Directory groups.

Example: 
```powershell
Get-ADGroup -Filter {Name -like "Sales*"}
```

### [New-ADGroup](https://docs.microsoft.com/en-us/powershell/module/addsadministration/new-adgroup)
Creates a new Active Directory group.

Example: 
```powershell
New-ADGroup -Name "SalesTeam" -GroupScope Global -GroupCategory Security
```

### [Add-ADGroupMember](https://docs.microsoft.com/en-us/powershell/module/addsadministration/add-adgroupmember)
Adds members to an Active Directory group.

Example: 
```powershell
Add-ADGroupMember -Identity SalesTeam -Members jdoe,asmith
```

### [Remove-ADGroupMember](https://docs.microsoft.com/en-us/powershell/module/addsadministration/remove-adgroupmember)
Removes members from an Active Directory group.

Example: 
```powershell
Remove-ADGroupMember -Identity SalesTeam -Members jdoe
```

## Organizational Unit (OU) Management

### [Get-ADOrganizationalUnit](https://docs.microsoft.com/en-us/powershell/module/addsadministration/get-adorganizationalunit)
Retrieves one or more Active Directory OUs.

Example: 
```powershell
Get-ADOrganizationalUnit -Filter {Name -like "Sales*"}
```

### [New-ADOrganizationalUnit](https://docs.microsoft.com/en-us/powershell/module/addsadministration/new-adorganizationalunit)
Creates a new Active Directory OU.

Example: 
```powershell
New-ADOrganizationalUnit -Name "SalesOU" -Path "OU=Groups,DC=domain,DC=com"
```

### [Remove-ADOrganizationalUnit](https://docs.microsoft.com/en-us/powershell/module/addsadministration/remove-adorganizationalunit)
Removes an Active Directory OU.

Example: 
```powershell
Remove-ADOrganizationalUnit -Identity "OU=SalesOU,OU=Groups,DC=domain,DC=com" -Recursive
remove-adorga```nizationalunit)
```

## Security Group Management

### [Get-ADGroup](https://docs.microsoft.com/en-us/powershell/module/addsadministration/get-adgroup)
Retrieves one or more Active Directory security groups.

Example: 
```powershell
Get-ADGroup -Filter {GroupCategory -eq "Security"}
```

### [New-ADGroup](https://docs.microsoft.com/en-us/powershell/module/addsadministration/new-adgroup)
Creates a new Active Directory security group.

Example: 
```powershell
New-ADGroup -Name "FinanceGroup" -GroupScope Global -GroupCategory Security
```

### [Add-ADGroupMember](https://docs.microsoft.com/en-us/powershell/module/addsadministration/add-adgroupmember)
Adds members to an Active Directory security group.

Example: 
```powershell
Add-ADGroupMember -Identity FinanceGroup -Members jsmith,jdoe
```

### [Remove-ADGroupMember](https://docs.microsoft.com/en-us/po
Removes members from an Active Directory security group.

Example: 
```powershell
Remove-ADGroupMember -Identity FinanceGroup -Members jdoe
```
