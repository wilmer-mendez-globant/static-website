variable "website_name" {
  description = "The name of your static website."
  type        = string
}

variable "region" {
  description = "AWS region this bucket should reside in"
  type        = string
}

variable "force_destroy" {
  description = "Delete all objects from the bucket so that the bucket can be destroyed even when not empty"
  type        = bool
  default     = false
}

variable "tags" {
  description = "Tags to add to resources"
  type        = map(string)
  default     = {}
}