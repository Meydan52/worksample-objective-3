# Keep the state file in the cloud.
terraform {
  backend "s3" {
    bucket = "e-fuse-terraform-state-projet-o301"
    key    = "path/to/my/key"
    region = "us-east-2"
  }
}

