output "asg_name" {
  value = aws_autoscaling_group.asg.name
}

output "asg_sg_id" {
  value = aws_security_group.sg.id
  
}

output "image_id" {
  value = data.aws_ami.ubuntu.id
  
}