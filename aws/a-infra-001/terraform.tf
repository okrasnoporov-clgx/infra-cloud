terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 6.6,  <=6.7"
    }
  }
}

# Configure the AWS Provider
provider "aws" {
  region = var.region
  profile = "terraform"
}
