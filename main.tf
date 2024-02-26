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
  region = "eu-west-2"
}

# Create a VPC
resource "aws_vpc" "dev-vpc" {
  cidr_block = "10.0.0.0/16"
  enable_dns_support = true
  enable_dns_hostnames = true
}

resource "aws_internet_gateway" "dev-igw" {
  vpc_id = aws_vpc.dev-vpc.id

  tags = {
    Name = "dev-igw"
  }
}

resource "aws_route_table" "dev-public-rt" {
  vpc_id = aws_vpc.dev-vpc.id

  route {
    cidr_block = "0.0.0.0/0"
    gateway_id = aws_internet_gateway.dev-igw.id
  }

  tags = {
    Name = "public-rt"
  }
}

# Associate Public Subnets with Public Route Table
resource "aws_route_table_association" "public_subnet_association_1" {
  subnet_id      = aws_subnet.pub-subnet-1.id
  route_table_id = aws_route_table.dev-public-rt.id
}

resource "aws_route_table_association" "public_subnet_association_2" {
  subnet_id      = aws_subnet.pub-subnet-2.id
  route_table_id = aws_route_table.dev-public-rt.id
}



# Create a private subnet
resource "aws_subnet" "priv-subnet-1" {
  vpc_id     = aws_vpc.dev-vpc.id
  cidr_block = "10.0.1.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "priv-subnet-1"
  }
}

# Create a second private subnet 
resource "aws_subnet" "priv-subnet-2" {
  vpc_id     = aws_vpc.dev-vpc.id
  cidr_block = "10.0.2.0/24"
  availability_zone = "eu-west-2b"

  tags = {
    Name = "priv-subnet-2"
  }
}

# Create a public subnet
resource "aws_subnet" "pub-subnet-1" {
  vpc_id     = aws_vpc.dev-vpc.id
  cidr_block = "10.0.3.0/24"
  availability_zone = "eu-west-2a"

  tags = {
    Name = "pub-subnet-1"
  }
}

# Create a second public subnet
resource "aws_subnet" "pub-subnet-2" {
  vpc_id     = aws_vpc.dev-vpc.id
  cidr_block = "10.0.4.0/24"
  availability_zone = "eu-west-2b"

  tags = {
    Name = "pub-subnet-2"
  }
}

# Database Subnets
resource "aws_subnet" "db_subnet_1" {
  vpc_id            = aws_vpc.dev-vpc.id
  cidr_block        = "10.0.5.0/24"
  availability_zone = "eu-west-2a"
}

resource "aws_subnet" "db_subnet_2" {
  vpc_id            = aws_vpc.dev-vpc.id
  cidr_block        = "10.0.6.0/24"
  availability_zone = "eu-west-2a"
}