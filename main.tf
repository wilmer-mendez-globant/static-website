# ~~~~~~~~~~~~~~~~~~~~~~~
# DEPLOY A STATIC WEBSITE
# ~~~~~~~~~~~~~~~~~~~~~~~

# REQUIRE A SPECIFIC TERRAFORM VERSION OR HIGHER
terraform {
  required_version = ">= 0.12.20"
}

# ------------------------------------------------
# CREATE THE S3 WEBSITE BUCKET AND ATTACH A POLICY
# ------------------------------------------------
resource "aws_s3_bucket" "website" {
  bucket        = var.website_name
  acl           = "public-read"
  tags          = var.tags
  region        = var.region
  force_destroy = var.force_destroy

  website {
    index_document = "index.html"
    error_document = "error.html"
  }
}

resource "aws_s3_bucket_policy" "website" {
  bucket = aws_s3_bucket.website.id
  policy = data.aws_iam_policy_document.website.json
}

data "aws_iam_policy_document" "website" {
  statement {
    actions = [
    "s3:GetObject"]

    resources = [
    "${aws_s3_bucket.website.arn}/*"]

    principals {
      type        = "AWS"
      identifiers = ["*"]
    }
  }
}