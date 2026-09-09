terraform apply `
--var-file=.\environments\dev\dev.tfvars `
--var-file=.\environments\dev\dev-global.tfvars `
--var-file=.\environments\dev\dev-aag.tfvars `
--var-file=.\environments\dev\dev-vnet.tfvars `
--auto-approve