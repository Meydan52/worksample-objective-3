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

