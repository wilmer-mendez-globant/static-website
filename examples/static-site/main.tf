# --------------------------
# CONFIGURE OUR AWS PROVIDER
# --------------------------

provider "aws" {
  region = var.region
}

# ----------------------------------------------
# CREATE THE S3 WEBSITE AND STORE SAMPLE CONTENT
# ----------------------------------------------
module "website" {
  source = "../../"

  region       = var.region
  website_name = var.website_name

  // We want to be able to destroy after the test
  force_destroy = true
  tags          = var.tags
}

resource "aws_s3_bucket_object" "index" {
  key          = "index.html"
  bucket       = module.website.s3_bucket_name
  source       = "index.html"
  acl          = "public-read"
  content_type = "text/html"
}

resource "aws_s3_bucket_object" "error" {
  key          = "error.html"
  bucket       = module.website.s3_bucket_name
  source       = "error.html"
  acl          = "public-read"
  content_type = "text/html"
}
