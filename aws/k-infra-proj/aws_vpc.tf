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

module "vpc_subnet_2" {
  source = "./modules/vpc_subnet"

  vpc_id                  = module.vpc.id
  name                    = var.subnet_2_name
  cidr_block              = var.subnet_2_cidr_block
  availability_zone       = var.subnet_2_availability_zone
  map_public_ip_on_launch = var.subnet_map_public_ip_on_launch
  tags                    = var.subnet_tags
}

resource "aws_internet_gateway" "eks" {
  vpc_id = module.vpc.id

  tags = merge(var.subnet_tags, {
    Name = "${var.vpc_name}-eks-igw"
  })
}

resource "aws_route_table" "eks_public" {
  vpc_id = module.vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.eks.id
  }

  tags = merge(var.subnet_tags, {
    Name = "${var.vpc_name}-eks-public"
  })
}

resource "aws_route_table_association" "eks_public" {
  for_each = {
    primary   = module.vpc_subnet.id
    secondary = module.vpc_subnet_2.id
  }

  subnet_id      = each.value
  route_table_id = aws_route_table.eks_public.id
}
