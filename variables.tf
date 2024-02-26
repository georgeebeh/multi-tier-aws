variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "az1" {
  description = "The availability zone for the first availability zone"
  type        = string
  default     = "eu-west-2a"
}

variable "az2" {
  description = "The availability zone for the second availability zone"
  type        = string
  default     = "eu-west-2b"
}