provider "aws" {
  region = var.region
}

# Create an S3 bucket for Terraform state
resource "aws_s3_bucket" "terraform_state_s3" {
  bucket = var.bucketname
}

resource "aws_s3_bucket_acl" "s3-backend-acl" {
  bucket = aws_s3_bucket.terraform_state_s3.id
  acl    = "private"
}

resource "aws_s3_bucket_versioning" "s3-backend-versioning" {
  bucket = aws_s3_bucket.terraform_state_s3.id
  versioning_configuration {
    status = "Enabled"
  }
}



# Create a DynamoDB table for state locking
resource "aws_dynamodb_table" "terraform_state_lock" {
  name           = var.dynamo-db-table
  billing_mode   = "PAY_PER_REQUEST"
  hash_key       = "LockID"

  attribute {
    name = "LockID"
    type = "S"
  }
}
