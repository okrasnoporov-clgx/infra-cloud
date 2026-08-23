# infra-cloud
IaC for using Terraform AzureRM provider

PowerShell
$env:TF_VAR_tenant_id = "<your-tenant-id>"
$env:TF_VAR_subscription_id = "<your-subscription-id>"

terraform plan -var-file=".\environments\dev\dev.tfvars"
terraform apply --var-file=./environments/dev/dev.tfvars --auto-approve

