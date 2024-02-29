variable "region" {
  description = "The AWS region to deploy resources"
  
  
}

variable "bucketname" {
  description = "The name of the S3 bucket to store Terraform state"
    
}

variable "dynamo-db-table" {
  description = "The name of the DynamoDB table to store Terraform state lock"
  
}

