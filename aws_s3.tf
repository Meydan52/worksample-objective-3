# Create the bucket
resource "aws_s3_bucket" "example" {
  bucket = var.bucket_name
}

# Make the bucket private (implicit deny). Only later-set permissions will apply
resource "aws_s3_bucket_acl" "example" {
  bucket = aws_s3_bucket.example.id
  acl    = "private"
}

# Enable versioning
resource "aws_s3_bucket_versioning" "versioning_example" {
  bucket = aws_s3_bucket.example.id
  versioning_configuration {
    status = "Enabled"
  }
}
# Give read permission to public with given policy. Public can read only since the explicit deny was set above
resource "aws_s3_bucket_policy" "public_read_policy" {
  bucket = aws_s3_bucket.example.id
  policy = data.aws_iam_policy_document.allow_public_read.json
}
# Policy to give read acces to public
data "aws_iam_policy_document" "allow_public_read" {
  statement {
    principals {
      type        = "*"
      identifiers = ["*"]
    }

    effect = "Allow"

    actions = [
      "s3:GetObject",
    ]

    resources = [
      "${aws_s3_bucket.example.arn}/*",
    ]
  }
}

