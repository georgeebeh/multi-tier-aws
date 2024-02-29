# modules/alb/main.tf

# Create an Application Load Balancer
resource "aws_lb" "application" {
  name               = var.alb_name
  internal           = var.alb_internal
  load_balancer_type = "application"
  security_groups    = [ aws_security_group.alb_sg.id ]
  subnets            = var.alb_subnet_ids

  enable_deletion_protection = var.alb_deletion_protection

  tags = {
    Name = var.alb_name
  }
}

# Create a listener for the ALB
resource "aws_lb_listener" "web" {
  load_balancer_arn = aws_lb.application.arn
  port              = var.alb_listener_port
  protocol          = var.alb_listener_protocol

  default_action {
    type             = "forward"
    target_group_arn = var.alb_target_group_arn
  }
}

# Create an ALB Listener Rule
resource "aws_lb_listener_rule" "static" {
  listener_arn = aws_lb_listener.web.arn
  priority     = 100

  action {
    type             = "forward"
    target_group_arn = aws_lb_target_group.application.arn
  }

  condition {
    path_pattern {
      values = ["*"]
    }
  }
}

# Create a target group for the ALB
resource "aws_lb_target_group" "application" {
  name     = var.alb_target_group_name
  port     = var.alb_target_group_port
  protocol = var.alb_target_group_protocol
  vpc_id   = var.vpc_id
  

  health_check {
    path                = var.alb_health_check_path
    protocol            = var.alb_target_group_protocol
    timeout             = var.alb_health_check_timeout
    interval            = var.alb_health_check_interval
    healthy_threshold   = var.alb_health_check_healthy_threshold
    unhealthy_threshold = var.alb_health_check_unhealthy_threshold
    matcher             = var.alb_health_check_matcher
  }
}

resource "aws_security_group" "alb_sg" {
  name        = "${var.alb_name}_sg"
  description = "Used in the ALB module"
  vpc_id      = var.vpc_id

ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }

  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"]
  }


  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"] 
 
}
tags = {
    Name = "alb_sg"
  }
}
