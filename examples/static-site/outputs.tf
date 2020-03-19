output "s3_bucket_name" {
  description = "Name of of website bucket"
  value       = module.website.s3_bucket_name
}

output "s3_bucket_website_endpoint" {
  value       = module.website.s3_bucket_website_endpoint
  description = "Website endpoint for the S3 bucket"
}