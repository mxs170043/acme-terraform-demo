terraform {

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

  bucket = "demo-bucket-${var.suffix}"

  versioning = {
    enabled = true
  }
}
module "s3_bucket_3" { 
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "5.12.0"

  bucket = "maryam--x${var.suffix}" 

  versioning = {
    enabled = true
  }
} 