output "vpc_id" {
  value = aws_vpc.dev-vpc.id
}
output "alb_subnet_ids" {
  value = [aws_subnet.pub-subnet-1.id, aws_subnet.pub-subnet-2.id ]
}
output "public_subnet_ids" {
  description = "The IDs of the public subnets"
  value       = [aws_subnet.pub-subnet-1.id, aws_subnet.pub-subnet-2.id] 
}

output "priv-subnet-1-id" {
  description = "The IDs of the private subnets"
  value       = aws_subnet.priv-subnet-1.id 
}

output "priv-subnet-2-id" {
  description = "The IDs of the private subnets"
  value       = aws_subnet.priv-subnet-2.id   
} 
 
output "public_subnet_cidr_blocks" {
  description = "The CIDR blocks of the public subnets"
  value       = [aws_subnet.pub-subnet-1.cidr_block, aws_subnet.pub-subnet-2.cidr_block]
}