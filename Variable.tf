variable "user_name" {
  description = "Please provide IAM User Name"
  type        = string
  default     = "new_test_user"
}
variable "region" {
  description = "Please provide a region name"
  type        = string
  default     = "us-east-2"
}

variable "bucket_name" {
  description = "Bucket Name"
  type        = string
  default     = "new-test-bucket-for-efuse-01"
}

variable "backend_bucket_name" {
  description = "Backend Bucket Name"
  type        = string
  default     = "e-fuse-terraform-state-projet-o301"
}

variable "backend_bucket_key" {
  description = "Backend Bucket Key"
  type        = string
  default     = "path/to/my/key"
}

variable "backend_bucket_region" {
  description = "Backand bucket region "
  type        = string
  default     = "us-east-2"
}