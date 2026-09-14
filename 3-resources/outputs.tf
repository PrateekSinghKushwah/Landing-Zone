output "storage_bucket_urls" {
  description = "Bucket URLs keyed by Terraform identifier."
  value       = { for key, bucket in module.storage_buckets : key => bucket.url }
}
