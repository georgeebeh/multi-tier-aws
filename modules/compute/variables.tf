variable "asg_name" {
  description = "Name for the Auto Scaling Group"
  type        = string
  default = "dev-asg"
}

variable "image_id" {
  description = "AMI ID for the instances"
  type        = string
  default = "ami-06b52a67c6abeda89"
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

variable "priv-subnet-1-id" {
  description = "A list of subnet IDs to launch resources in"
  type        = string
  }
variable "priv-subnet-2-id" {
  description = "A list of subnet IDs to launch resources in"
  type        = string
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

variable "alb_sg_id" {
  description = "The ID of the ALB security group"
  type        = string
}

variable "alb_target_group_arn" {
  description = "The arn of the ALB target group"
  type        = string
}