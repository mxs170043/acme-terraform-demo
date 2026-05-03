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

    google = {
      source  = "hashicorp/google"
      version = "7.29.0"
    }
  }
}

provider "aws" {
  region = var.aws_region
}

provider "google" {
  project = var.project_id
  region  = var.region
}

# module "s3_bucket" {
#   source  = "terraform-aws-modules/s3-bucket/aws"
#   version = "5.12.0"

#   bucket = "maryam-shahid${var.suffix}"

#   versioning = {
#     enabled = true
#   }
# }
# module "s3_bucket_3" { 
#   source  = "terraform-aws-modules/s3-bucket/aws"
#   version = "5.12.0"

#   bucket = "maryam--x${var.suffix}" 

#   versioning = {
#     enabled = true
#   }
# }


resource "google_storage_bucket" "this" {
  name     = "acme-demo-bucket-${var.suffix}"
  location = var.region

  labels = {
    environment = "dev"
    managed_by  = "terraform"
  }
}