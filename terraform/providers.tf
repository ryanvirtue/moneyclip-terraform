terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.46.0"
    }
  }
  
  required_version = ">= 1.0"
  
  backend "s3" {
    bucket = "moneyclip-terraform"
    key    = "moneyclip/terraform.tfstate"
    region = "ap-southeast-2"
  }
}

provider "aws" {
  region = var.aws_region
}
