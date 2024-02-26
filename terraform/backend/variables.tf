variable "region" {
  description = "The AWS region to deploy resources"
  default     = "eu-west-2"
  
}

variable "bucketname" {
  description = "The name of the S3 bucket to store Terraform state"
  default     = "multi-tier-tf-state-bucket-ebeh"
  
}