# DNS Server Setup Script
# Author: Meuz Kidane
# Jan 26, 2024


# Define DNS Configuration *

$dnsConfig = @{
    ZoneName            = "zion.ca"
    DynamicUpdate       = "None"
    ReplicationScope    = "Domain"
}

# Get Server IP Address

$ipv4 = (Get-NetIPAddress -AddressFamily IPv4 | Select -Index 0).IPAddress
$ipv6 = (Get-NetIPAddress -AddressFamily IPv6 | Select -Index 0).IPAddress

# Define DNS Records *

$dnsRecords = @{
    RecordA_1   = @{
        Type    = "A"
        Name    = "www"
        IP      = $ipv4
    }
    
    RecordA_2   = @{
        Type    = "A"
        Name    = "support"
        IP      = $ipv4
    }
    
    RecordA_3   = @{
        Type    = "A"
        Name    = "www2"
        IP      = $ipv4
    }

    RecordAAAA_1    = @{
        Type        = "AAAA"
        Name        = "www3"
        IP          = $ipv6
    }

    # RecordCNAME_1   = @{
    #     Type        = "CNAME"
    #     Name        = "$($dnsConfig.ZoneName)1"
    #     Target      = $dnsConfig.ZoneName
    # }

    # RecordPTR_1 = @{
    #     Type    = "PTR"
    #     Name    = "$ipv4.in-addr.arpa"
    #     Host    = $dnsConfig.ZoneName
    # }
    
}

# Installing DNS Role

Install-WindowsFeature -Name DNS -IncludeManagementTools

# Importing DNS Module

Import-Module DnsServer

# Check if The Zone Already Exist

if ( -not $(Get-DnsServerZone -Name $dnsConfig.ZoneName -ErrorAction SilentlyContinue )) { 
    
    # If Zone Doesn't Exist Create The Primary Zone

    Write-Host "Creating Zone ..."
    Add-DnsServerPrimaryZone @dnsConfig
 }else {
    Write-Host "Zone Already Exist."
    Write-Host "Creating the Records."
 }


# Create the Records

foreach ($record in $dnsRecords.Values) {
    # Check for DNS Record Type
    if ($record.Type -eq "A"){

        # Create the A Record
        Add-DnsServerResourceRecordA -Name $record.Name -IPv4Address $record.IP -ZoneName $dnsConfig.ZoneName
        
    }elseif ($record.Type -eq "AAAA") {
        
        # Create the AAAA Record
        Add-DnsServerResourceRecordAAAA -Name $record.Name -IPv4Address $record.IP -ZoneName $dnsConfig.ZoneName

    }elseif ($record.Type -eq "PTR") {

        # Create the CNAME Record
        
        Add-DnsServerResourceRecordCName -Name $record.Name -HostNameAlias $record.Target -ZoneName $dnsConfig.ZoneName
    }elseif ($record.Type -eq "CNAME") {

        # Create the CNAME PTR

        Add-DnsServerResourceRecordPtr -Name $record.Name -PtrDomainName $record.Host -ZoneName $dnsConfig.ZoneName
    }
}