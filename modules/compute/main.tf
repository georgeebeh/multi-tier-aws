resource "aws_key_pair" "my-key" {
  key_name   = "my-key"
  public_key = "ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIKUGNwuwQV9gPI0TqO2YUOPInDBTXv3S+6jaL4T7Fbo+ georgeebeh@gmail.com"
}


resource "aws_security_group" "sg" {
  name   = "${var.asg_name}_sg"
  vpc_id = var.vpc_id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    security_groups = [var.alb_sg_id]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    security_groups = [var.alb_sg_id]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

data "aws_ami" "ubuntu" {
  most_recent = true

  filter {
    name   = "name"
    values = ["ubuntu/images/hvm-ssd/ubuntu-focal-20.04-amd64-server-*"]
  }
  filter {
    name   = "virtualization-type"
    values = ["hvm"]
  }

  owners = ["099720109477"] # Canonical
}

data "template_file" "user_data" {
  template = <<-EOF
              #!/bin/bash
              apt-get update -y
              apt-get install -y apache2
              systemctl start apache2
              systemctl enable apache2
              echo "<h1>Welcome! This server is running in $(curl -s http://169.254.169.254/latest/meta-data/placement/availability-zone)</h1>" > /var/www/html/index.html
             EOF
}


resource "aws_launch_template" "lt" {
  name          = "${var.asg_name}_lt"
  image_id      = data.aws_ami.ubuntu.id
  instance_type = var.instance_type
  key_name      = var.key_name
  user_data = base64encode(data.template_file.user_data.rendered)

  network_interfaces {
    associate_public_ip_address = false
    security_groups             = [aws_security_group.sg.id]
  }
}

resource "aws_autoscaling_group" "asg" {
  name_prefix           = var.asg_name
  launch_template {
    id      = aws_launch_template.lt.id
    version = "$Latest"
  }
  #availability_zones = ["us-east-1a", "us-east-1b"]
  vpc_zone_identifier  = [ var.priv-subnet-1-id, var.priv-subnet-2-id ]
  target_group_arns =  [ var.alb_target_group_arn]
  min_size             = var.min_size
  max_size             = var.max_size
  desired_capacity     = var.desired_capacity
  health_check_type    = "EC2"



   tag {
    key                 = "Key"
    value               = "Value"
    propagate_at_launch = true
  }

  instance_refresh {
    strategy = "Rolling"
    preferences {
      min_healthy_percentage = 50
    }
    triggers = ["tag"]
  }
}