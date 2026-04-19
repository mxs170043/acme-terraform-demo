terraform {
  cloud {
    organization = "acme-demo-tf"

    workspaces {
      name = "acme-terraform-dev"
    }
  }

  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "app_bucket" {
  source      = "../../modules/s3-bucket"
  environment = var.environment
  bucket_name = "acme-app-data"
  suffix      = var.suffix
}