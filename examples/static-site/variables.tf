variable "website_name" {
  description = "The name of your static website. Note that this needs to be globally unique"
  type        = string
  default     = "terratest-with-gh-actions"
}

variable "region" {
  description = "AWS region this bucket should reside in"
  type        = string
  default     = "us-east-1"
}

variable "tags" {
  description = "Tags to add to resources"
  type        = map(string)
  default = {
    CI = "true"
  }
}