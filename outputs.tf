output "s3_bucket_website_endpoint" {
  value       = aws_s3_bucket.website.website_endpoint
  description = "Website endpoint for the S3 bucket"
}

output "s3_bucket_name" {
  description = "Name of of website bucket"
  value       = aws_s3_bucket.website.id
}