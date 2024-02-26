variable "asg_name" {
  description = "Name for the Auto Scaling Group"
  type        = string
}

variable "image_id" {
  description = "AMI ID for the instances"
  type        = string
}

variable "instance_type" {
  description = "Type of instance to launch"
  type        = string
}

variable "key_name" {
  description = "The key name to use for the instance"
  type        = string
}

variable "vpc_id" {
  description = "The ID of the VPC where the resources will be created"
  type        = string
}

variable "subnet_ids" {
  description = "A list of subnet IDs to launch resources in"
  type        = list(string)
}

variable "min_size" {
  description = "Minimum size of the Auto Scaling Group"
  type        = number
}

variable "max_size" {
  description = "Maximum size of the Auto Scaling Group"
  type        = number
}

variable "desired_capacity" {
  description = "Desired number of instances in the Auto Scaling Group"
  type        = number
}