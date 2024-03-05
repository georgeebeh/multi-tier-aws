terraform {
  backend "s3" {
    bucket = "dev-state-bucket1152"
    key    = "dev/terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "dev-state-table1152"
    encrypt = true
  }
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 4.0"
    }
  }
}

# Configure the AWS Provider  
provider "aws" {
  region = var.region
}


# Networking module
module "networking" {
  source = "../modules/networking"

  # Include any necessary input variables for the networking module
  vpc_cidr             = var.vpc_cidr
  public_subnet_cidr_blocks    = var.public_subnet_cidr_blocks
  private_subnet_cidr_blocks   = var.private_subnet_cidr_blocks
  availability_zones           = ["us-east-1a", "us-east-1b"]
  vpc_name                     = "my-vpc"
}

# ALB module
module "alb" {
  source = "../modules/alb"

  # Include any necessary input variables for the ALB module
  alb_name                     = "my-alb"
  alb_subnet_ids               = module.networking.public_subnet_ids
  alb_security_group_id        = module.alb.alb_sg_id
  vpc_id                       = module.networking.vpc_id
  alb_target_group_arn = module.alb.alb_target_group_arn
  
}


# ASG module
module "compute" {
  source = "../modules/compute"
  # Include any necessary input variables for the ASG module
  asg_name                     = var.asg_name
  vpc_id                       = module.networking.vpc_id
  alb_target_group_arn = module.alb.alb_target_group_arn
  alb_sg_id  = module.alb.alb_sg_id
  min_size = 1
  max_size = 3
  desired_capacity = 2
  image_id = var.image_id
  instance_type = var.instance_type
  key_name = var.key_name
  priv-subnet-1-id = module.networking.priv-subnet-1-id
  priv-subnet-2-id = module.networking.priv-subnet-2-id
}

