resource "aws_security_group" "sg" {
  name   = "${var.asg_name}_sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

resource "aws_launch_template" "lt" {
  name          = "${var.asg_name}_lt"
  image_id      = var.image_id
  instance_type = var.instance_type
  key_name      = var.key_name

  network_interfaces {
    associate_public_ip_address = true
    security_groups             = [aws_security_group.sg.id]
  }
}

resource "aws_autoscaling_group" "asg" {
  name_prefix           = var.asg_name
  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }
  vpc_zone_identifier  = var.subnet_ids
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  health_check_type    = "EC2"
}