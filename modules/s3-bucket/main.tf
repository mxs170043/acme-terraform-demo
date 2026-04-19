resource "aws_s3_bucket" "this" {
  bucket = "${var.environment}-${var.bucket_name}-${var.suffix}"

  tags = {
    Environment = var.environment
    ManagedBy   = "terraform"
  }
}