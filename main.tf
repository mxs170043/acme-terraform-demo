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
      version = "6.42.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "5.12.0"

  bucket = "my-unique-bucket-name"

  versioning = {
    enabled = true
  }
}
