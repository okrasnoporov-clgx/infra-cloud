module "vpc" {
  source = "./modules/vpc"

  name                 = var.vpc_name
  cidr_block           = var.vpc_cidr_block
  enable_dns_support   = var.vpc_enable_dns_support
  enable_dns_hostnames = var.vpc_enable_dns_hostnames
  tags                 = var.vpc_tags
}

module "vpc_subnet" {
  source = "./modules/vpc_subnet"

  vpc_id                  = module.vpc.id
  name                    = var.subnet_name
  cidr_block              = var.subnet_cidr_block
  availability_zone       = var.subnet_availability_zone
  map_public_ip_on_launch = var.subnet_map_public_ip_on_launch
  tags                    = var.subnet_tags
}

