Add-AzureRmAccount
Set-AzureRmContext -SubscriptionId efa47772-a192-4398-abb9-30bd38270bb0
$app = New-AzureRmADApplication -DisplayName "PowerShellLogin" -HomePage "{URL}/PowerShellLogin" -IdentifierUris "{URL}/PowerShellLogin" -Password "{Pass}"
$app
New-AzureRmADServicePrincipal -ApplicationId $app.ApplicationId
New-AzureRmRoleAssignment -RoleDefinitionName Reader -ServicePrincipalName $app.ApplicationId