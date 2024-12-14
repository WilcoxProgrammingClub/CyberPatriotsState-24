#INSTRUCTIONS:
#Make sure that Powershell allows script running (I think this is where we messed up last time)
#1. Run Powershell as administrator
#2. Run the command "Get-ExecutionPolicy"
#3. If it says Restricted, run "Set-ExecutionPolicy -Scope CurrentUser Unrestricted"
#4. Make sure to change it back to "restricted" at the end, if it is not already restricted this may give us points
#use "cd .." to back up to higher location and "cd <location>" to enter one
#run the file using ".\<file extension>" once you are on the desktop path


#~~~~GROUP POLICY AND USER SETTINGS~~~~

# Export current security policy configuration
secedit /export /cfg "C:\secedit.cfg"

# Load the security policy configuration file
$configFile = Get-Content "C:\secedit.cfg"

#Password Policy
$configFile = $configFile -replace "PasswordHistorySize = \d+", "PasswordHistorySize = 24"
$configFile = $configFile -replace "MaximumPasswordAge = \d+", "MaximumPasswordAge = 60"
$configFile = $configFile -replace "MinimumPasswordAge = \d+", "MinimumPasswordAge = 1"
$configFile = $configFile -replace "MinimumPasswordLength = \d+", "MinimumPasswordLength = 10"
$configFile = $configFile -replace "PasswordComplexity = \d+", "PasswordComplexity = 1"
$configFile = $configFile -replace "ClearTextPassword = \d+", "ClearTextPassword = 0"

#Lockout Policy
$configFile = $configFile -replace "LockoutDuration = \d+", "LockoutDuration = 30"
$configFile = $configFile -replace "LockoutBadCount = \d+", "LockoutBadCount = 10"
$configFile = $configFile -replace "ResetLockoutCount = \d+", "ResetLockoutCount = 30"

#Audit Policy
$configFile = $configFile -replace "AuditAccountLogon = \d+", "AuditAccountLogon = 3"
$configFile = $configFile -replace "AuditAccountManage = \d+", "AuditAccountManage = 3"
$configFile = $configFile -replace "AuditDSAccess = \d+", "AuditDSAccess = 3"
$configFile = $configFile -replace "AuditLogonEvents = \d+", "AuditLogonEvents = 3"
$configFile = $configFile -replace "AuditObjectAccess = \d+", "AuditObjectAccess = 3"
$configFile = $configFile -replace "AuditPolicyChange = \d+", "AuditPolicyChange = 3"
$configFile = $configFile -replace "AuditPrivilegeUse = \d+", "AuditPrivilegeUse = 3"
$configFile = $configFile -replace "AuditProcessTracking = \d+", "AuditProcessTracking = 3"
$configFile = $configFile -replace "AuditSystemEvents = \d+", "AuditSystemEvents = 3"
$configFile = $configFile -replace "AuditDetailedTracking = \d+", "AuditDetailedTracking = 3"
$configFile = $configFile -replace "AuditGlobalObjectAccess = \d+", "AuditGlobalObjectAccess = 3"

#User Rights Assignment
$configFile = $configFile -replace "SeBackupPrivilege = .+", 'SeBackupPrivilege = *S-1-5-32-544'
$configFile = $configFile -replace "SeSystemtimePrivilege = .+", 'SeSystemtimePrivilege = *S-1-5-32-544,*S-1-5-19'
$configFile = $configFile -replace "SeTimeZonePrivilege = .+", 'SeTimeZonePrivilege = *S-1-5-32-544,*S-1-5-19,*S-1-5-32-545'
$configFile = $configFile -replace "SeCreatePagefilePrivilege = .+", 'SeCreatePagefilePrivilege = *S-1-5-32-544'
$configFile = $configFile -replace "SeCreateTokenPrivilege = .+", 'SeCreateTokenPrivilege = *S-1-5-32-544,*S-1-5-19,*S-1-5-20,*S-1-5-6'
$configFile = $configFile -replace "SeCreateGlobalPrivilege = .+", 'SeCreateGlobalPrivilege = *S-1-5-32-544,*S-1-5-19,*S-1-5-20,*S-1-5-6'
$configFile = $configFile -replace "SeCreatePermanentPrivilege = .+", 'SeCreatePermanentPrivilege = *S-1-5-32-544'
$configFile = $configFile -replace "SeCreateSymbolicLinkPrivilege = .+", 'SeCreateSymbolicLinkPrivilege = *S-1-5-32-544'
$configFile = $configFile -replace "SeDebugPrivilege = .+", 'SeDebugPrivilege = *S-1-5-32-546,*S-1-5-113'
$configFile = $configFile -replace "SeDenyNetworkLogonRight = .+", 'SeDenyNetworkLogonRight = *S-1-5-32-546'
$configFile = $configFile -replace "SeDenyBatchLogonRight = .+", 'SeDenyBatchLogonRight = '
$configFile = $configFile -replace "SeDenyServiceLogonRight = .+", 'SeDenyServiceLogonRight = '
$configFile = $configFile -replace "SeDenyInteractiveLogonRight = .+", 'SeDenyInteractiveLogonRight = *S-1-5-32-546,*S-1-5-113'
$configFile = $configFile -replace "SeDenyRemoteInteractiveLogonRight = .+", 'SeDenyRemoteInteractiveLogonRight = '
$configFile = $configFile -replace "SeEnableDelegationPrivilege = .+", 'SeEnableDelegationPrivilege = *S-1-5-32-544'
$configFile = $configFile -replace "SeRemoteShutdownPrivilege = .+", 'SeRemoteShutdownPrivilege = *S-1-5-32-544'
$configFile = $configFile -replace "SeAuditPrivilege = .+", 'SeAuditPrivilege = *S-1-5-19,*S-1-5-20'
$configFile = $configFile -replace "SeImpersonatePrivilege = .+", 'SeImpersonatePrivilege = *S-1-5-32-544,*S-1-5-19,*S-1-5-20,*S-1-5-6'
$configFile = $configFile -replace "SeIncreaseBasePriorityPrivilege = .+", 'SeIncreaseBasePriorityPrivilege = *S-1-5-32-544'
$configFile = $configFile -replace "SeLoadDriverPrivilege = .+", 'SeLoadDriverPrivilege = *S-1-5-32-544'
$configFile = $configFile -replace "SeLockMemoryPrivilege = .+", 'SeLockMemoryPrivilege = '
$configFile = $configFile -replace "SeBatchLogonRight = .+", 'SeBatchLogonRight = *S-1-5-32-544,*S-1-5-32-551'
$configFile = $configFile -replace "SeServiceLogonRight = .+", 'SeServiceLogonRight = '
$configFile = $configFile -replace "SeSecurityPrivilege = .+", 'SeSecurityPrivilege = *S-1-5-32-544'
$configFile = $configFile -replace "SeRelabelPrivilege = .+", 'SeRelabelPrivilege = '
$configFile = $configFile -replace "SeSystemEnvironmentPrivilege = .+", 'SeSystemEnvironmentPrivilege = *S-1-5-32-544'
$configFile = $configFile -replace "SeManageVolumePrivilege = .+", 'SeManageVolumePrivilege = *S-1-5-32-544'
$configFile = $configFile -replace "SeProfileSingleProcessPrivilege = .+", 'SeProfileSingleProcessPrivilege = *S-1-5-32-544'
$configFile = $configFile -replace "SeSystemProfilePrivilege = .+", 'SeSystemProfilePrivilege = *S-1-5-32-544,*S-1-5-80-4062745309-4008385029-3357821680-294805924-1280956887'
$configFile = $configFile -replace "SeAssignPrimaryTokenPrivilege = .+", 'SeAssignPrimaryTokenPrivilege = *S-1-5-19,*S-1-5-20'
$configFile = $configFile -replace "SeRestorePrivilege = .+", 'SeRestorePrivilege = *S-1-5-32-544,*S-1-5-32-551'
$configFile = $configFile -replace "SeShutdownPrivilege = .+", 'SeShutdownPrivilege = *S-1-5-32-544,*S-1-5-32-545'
$configFile = $configFile -replace "SeTakeOwnershipPrivilege = .+", 'SeTakeOwnershipPrivilege = *S-1-5-32-544'
$configFile = $configFile -replace "SeTrustedCredManAccessPrivilege = .+", 'SeTrustedCredManAccessPrivilege = '
$configFile = $configFile -replace "SeNetworkLogonRight = .+", 'SeNetworkLogonRight = *S-1-5-32-544'
$configFile = $configFile -replace "SeTcbPrivilege = .+", 'SeTcbPrivilege = '
$configFile = $configFile -replace "SeIncreaseQuotaPrivilege = .+", 'SeIncreaseQuotaPrivilege = *S-1-5-32-544,*S-1-5-19,*S-1-5-20'
$configFile = $configFile -replace "SeInteractiveLogonRight = .+", 'SeInteractiveLogonRight = *S-1-5-32-544,*S-1-5-32-545'
$configFile = $configFile -replace "SeRemoteInteractiveLogonRight = .+", 'SeRemoteInteractiveLogonRight = *S-1-5-32-544,*S-1-5-32-555'

#Misc
$configFile = $configFile -replace "AllowAdministratorLockout = \d+", "AllowAdministratorLockout = 1"
$configFile = $configFile -replace "RequireLogonToChangePassword = \d+", "RequireLogonToChangePassword = 1"
$configFile = $configFile -replace "ForceLogoffWhenHourExpire = \d+", "ForceLogoffWhenHourExpire = 1"
$configFile = $configFile -replace "NewAdministratorName = .+", 'NewAdministratorName = "minda"'
$configFile = $configFile -replace "ClearTextPassword = \d+", "ClearTextPassword = 0"
$configFile = $configFile -replace "EnableAdminAccount = \d+", "EnableAdminAccount = 0"
$configFile = $configFile -replace "EnableGuestAccount = \d+", "EnableGuestAccount = 0"

# Save the modified configuration file
$configFile | Set-Content "C:\secedit.cfg"

# Import the modified security policy
secedit /configure /db secedit.sdb /cfg "C:\secedit.cfg" /areas SECURITYPOLICY
secedit /configure /db secedit.sdb /cfg "C:\secedit.cfg" /areas USER_RIGHTS

# Clean up
if (Test-Path "C:\secedit.cfg") {
	Remove-Item "C:\secedit.cfg"
	Write-Output "cfg file deleted"
}
if (Test-Path "C:\secedit.sdb") {
	Remove-Item "C:\secedit.sdb"
	Write-Output "sdb file deleted"
}

#~~~~WINDOWS DEFENDER~~~~
# Enable Windows Defender Firewall for Private Network
Set-NetFirewallProfile -Profile Private -Enabled True

# Enable Windows Defender Firewall for Public Network
Set-NetFirewallProfile -Profile Public -Enabled True

# Check status to confirm the settings
Get-NetFirewallProfile -Profile Private, Public | Format-Table Name, Enabled

#~~~~GPUPDATE~~~~
gpupdate
gpupdate /force

#~~~~CONFIRM ACTIONS~~~~

#Windows Defender
Get-NetFirewallProfile -Profile Private, Public | Format-Table Name, Enabled

#Policy
secedit /export /cfg "C:\secedit.cfg"
$filePath = "C:\secedit.cfg"
Get-Content $filePath | more