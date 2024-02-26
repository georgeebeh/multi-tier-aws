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
  region = "us-west-2"
}

# Create a VPC
resource "aws_vpc" "dev-vpc" {
  cidr_block = "10.0.0.0/16"
}

# Create a subnet
resource "aws_subnet" "priv-subnet-1" {
  vpc_id     = aws_vpc.dev-vpc.id
  cidr_block = "10.0.1.0/24"

  tags = {
    Name = "priv-subnet-1"
  }
}

# Create a subnet
resource "aws_subnet" "priv-subnet-2" {
  vpc_id     = aws_vpc.dev-vpc.id
  cidr_block = "10.0.2.0/24"

  tags = {
    Name = "priv-subnet-2"
  }
}

# Create a subnet
resource "aws_subnet" "pub-subnet-1" {
  vpc_id     = aws_vpc.dev-vpc.id
  cidr_block = "10.0.3.0/24"

  tags = {
    Name = "pub-subnet-1"
  }
}

# Create a subnet
resource "aws_subnet" "pub-subnet-2" {
  vpc_id     = aws_vpc.dev-vpc.id
  cidr_block = "10.0.4.0/24"

  tags = {
    Name = "pub-subnet-2"
  }
}