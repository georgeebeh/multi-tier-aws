terraform {
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
  source = "./modules/networking"

  # Include any necessary input variables for the networking module
  vpc_cidr             = "10.0.0.0/16"
  public_subnet_cidr_blocks    = ["10.0.1.0/24", "10.0.2.0/24"]
  private_subnet_cidr_blocks   = ["10.0.10.0/24", "10.0.11.0/24"]
  availability_zones           = ["us-east-1a", "us-east-1b"]
  vpc_name                     = "my-vpc"
}

# ALB module
module "alb" {
  source = "./modules/alb"

  # Include any necessary input variables for the ALB module
  alb_name                     = "my-alb"
  alb_subnet_ids               = module.networking.public_subnet_ids
  alb_security_group_id        = module.alb.alb_sg_id
  vpc_id                       = module.networking.vpc_id
  # Add other variables as needed
}

# ASG module
module "asg" {
  source = "./modules/asg"
  # Include any necessary input variables for the ASG module
  asg_name                     = "my-asg"
  vpc_id                       = module.networking.vpc_id
  min_size = 1
  max_size = 3
  desired_capacity = 2
  image_id = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  key_name = "my-key"

  # Add other variables as needed
}

# Output
output "alb_dns_name" {
  value = module.alb.alb_dns_name
}