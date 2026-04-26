variable "aws_region" {
  default = "us-west-2"
}

variable "suffix" {
  type    = string
  default = "dev123"
}

variable "project_id" {
  type        = string
  description = "GCP project ID"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "zone" {
  type    = string
  default = "us-central1-a"
}