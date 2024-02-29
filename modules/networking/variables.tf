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

variable "public_subnet_cidr_blocks" {
  description = "The CIDR blocks for the public subnets"
  type        = list(string)
  default     = ["10.0.1.0/24", "10.0.2.0/24"]
  
}
variable "private_subnet_cidr_blocks" {
  description = "The CIDR blocks for the private subnets"
  type        = list(string)
  default     = ["10.0.10.0/24", "10.0.11.0/24"]
  
}

variable "availability_zones" {
  description = "The availability zones for the VPC"
  type        = list(string)
  default     = ["us-east-1a", "us-east-1b"]
  
}

variable "vpc_name" {
  description = "The name of the VPC"
  type        = string
  default     = "my-vpc"
  
}

