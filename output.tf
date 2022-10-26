# Make bucket arn accessable to use later
output "s3_bucket" {
  value       = aws_s3_bucket.example.arn
  description = "Bucket"
}

# Expose bucket region
output "bucket_region" {
  value       = aws_s3_bucket.example.region
  description = "s3 bucket region"
  sensitive   = true
}
# Make the key can be reachabel to upload files to S3. 
output "access_key_id" {
  value       = aws_iam_access_key.s3-user-key.id
  description = "Access key id for test user"
  sensitive   = true
}

# value       = base64encode(aws_iam_access_key.s3-user-key.secret)
output "secret_access_key" {
  value       = aws_iam_access_key.s3-user-key.secret
  description = "Secret access key for test user"
  sensitive   = true
}

