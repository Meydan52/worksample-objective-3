# Create iam user
resource "aws_iam_user" "s3-user" {
  name = var.user_name
  path = "/system/"
}

# Create user access key
resource "aws_iam_access_key" "s3-user-key" {
  user = aws_iam_user.s3-user.name
}

# Create user policy for the S3 bucket created
resource "aws_iam_user_policy" "s3-user-pol" {
  name = "${aws_iam_user.s3-user.name}-s3-policy"
  user = aws_iam_user.s3-user.name

  # Terraform's "jsonencode" function converts a
  # Terraform expression result to valid JSON syntax.
  policy = jsonencode({
    Version = "2012-10-17"
    Statement = [
      {
        Action = [
          "s3:GetObject*",
          "s3:ListBucket*",
          "s3:PutObject*",
          "s3:PutObjectAcl*"
        ]
        Effect = "Allow"
        Resource = [
          aws_s3_bucket.example.arn,
          "${aws_s3_bucket.example.arn}/*",
        ]
      },
    ]
  })
}

