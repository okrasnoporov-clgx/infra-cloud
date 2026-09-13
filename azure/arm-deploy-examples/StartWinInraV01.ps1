cls
Connect-AzureRmAccount
Save-AzureRmProfile -Path "C:\git\AzureWinInfra\AzElenaProfile.txt"

Get-AzureRmSubscription
#select subscr by ID"
Select-AzureRmSubscription "efa47772-a192-4398-abb9-30bd38270bb0"


#Login-AzureRmAccount is the same as Connect-AzureRmAccount ?

#==========================================================================
# The azure account here must not be a Live ID.

#$username = "elenadevops@outlook.com"
#$SecurePassword = Get-Content "C:\git\AzureWinInfra\Password.txt" | ConvertTo-SecureString
#$cred = new-object -typename System.Management.Automation.PSCredential -argumentlist $username, $SecurePassword
#
#
#$cred
#Login-AzureRmAccount -Credential $cred

#===========================================================================


