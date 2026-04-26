terraform {
  # cloud {
  #   organization = "acme-demo-tf"

  #   workspaces {
  #     name = "acme-terraform-dev"
  #   }
  # }

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

module "s3_bucket" {
  source  = "terraform-aws-modules/s3-bucket/aws"
  version = "5.12.0"

  bucket = "maryam-shahid-${var.suffix}"

  versioning = {
    enabled = true
  }
}

# module "instance_template" {
#   source  = "terraform-google-modules/vm/google//modules/instance_template"
#   version = "~> 13.0"

#   project_id   = var.project_id
#   region       = var.region
#   machine_type = "e2-micro"
# }

# module "compute_instance" {
#   source  = "terraform-google-modules/vm/google//modules/compute_instance"
#   version = "~> 14.0"

#   project_id        = var.project_id
#   region            = var.region
#   zone              = var.zone
#   instance_template = module.instance_template.self_link
# }
resource "google_storage_bucket" "this" {
  name     = "acme-demo-bucket-${var.suffix}"
  location = var.region

  labels = {
    environment = "dev"
    managed_by  = "terraform"
  }
}