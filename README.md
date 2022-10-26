# Worksample-objective-3

In this repo, there is an AWS IAM user and S3 bucket created with respected policies using Terraform and tested and automated using GitHub Actions pipeline.

## Prerequisites
 1. AWS Service account credentials should be added to GitHub actions as secrets

   - Create an AWS IAM user, which should have AdministratorAccess preferably, and Access key - Programmatic access 
   - From the repository’s GitHub Actions settings, add secrets and assign service account credentials. 

| **Secret Name** | **Secret** |
| :---: | :---: |
| `AWS_ACCESS_KEY_ID` | ACCESS_KEY_ID of the service account |
| `SECRET_ACCESS_KEY` | SECRET_ACCESS_KEY of the service account |

2.	Create a private S3 bucket to store terraform remote state and set it to **bucket**   in the **backend.tf** file along with the bucket region. Key value may remain as it is.
```
terraform {
  backend "s3" {
    bucket = "e-fuse-terraform-state-projet-o301"
    key    = "path/to/my/key"
    region = "us-east-2"
  }
}
```
## Run
Process is automated after providing a service account and setting the backend bucket. Pipelines trigers after each commits to the main branch and creates resources with given values in the **envs/var.tfvars** file and upload two sample txt files to the bucket using AWS CLI and newly created user key.

To customize bucket and the IAM user;

1. in **envs/var.tfvars** file, set the name and the region of the S3 bucket and user name that you want Terraform to create.
```
# change values
user_name      = "new_s3-test-user1"
bucket_name    = "new-test-bucket-for-efuse-02"
region         = "us-east-2"
```
2. Commit changes to the main branch.

## File Descriptions 
| **FIle** | **Purpose** |
| --- | --- |
| `variable.tf` | customizable variables defined in here to be used in other terraform blocks |
| `envs/var.tfvar` | User can set new values to variables to get different out comes|
| `aws_s3.tf` | Creates S3 bucket with defined name and assigns the S3 policy  |
| `iam_user.tf` | Creates IAM user with defined name and assigns a priviledges to get user have access to S3  |
| `provider.tf` | Providers (Plugins) are defined here |
| `output.tf` | Some needed terraform values exposed here to be used in the GitHub Actions pipeline |
| `testfile2.txt, testfile2.txt` | Sample files to test user-bucket acessibility over AWS CLI |
| `.github/workflows/pipeline.yml` | Workflow file to automate the entire process |
