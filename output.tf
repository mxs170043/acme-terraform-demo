# output "s3_bucket_id" {
#   value = module.s3_bucket.s3_directory_bucket_name

# }

output "gcp_bucket_name" {
  value = google_storage_bucket.this.name
}