variable "region" {
  description = "The AWS region to deploy resources"
  type        = string
  default    = "us-east-1"
}

variable "vpc_cidr" {
  description = "The CIDR block for the VPC"
  type        = string
  default     = "10.0.0.0/16"
}

variable "az1" {
  description = "The availability zone for the first availability zone"
  type        = string
  default     = "us-east-1a"
}

variable "az2" {
  description = "The availability zone for the second availability zone"
  type        = string
  default     = "us-east-1b"
}
variable "asg_name" {
  description = "Name for the Auto Scaling Group"
  type        = string
}

variable "key_name" {
  description = "The key name to use for the instance"
  type        = string
  
}