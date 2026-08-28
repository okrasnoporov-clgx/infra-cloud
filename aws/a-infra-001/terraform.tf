terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = ">= 6.23, < 7.0"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region  = var.region
  profile = "terraform"
}
