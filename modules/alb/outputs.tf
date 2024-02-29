output "alb_dns_name" {
  value = aws_lb.application.dns_name
}

output "alb_sg_id" {
  value = aws_security_group.alb_sg.id
}

output "alb_target_group_arn" {
  description = "The ARN of the load balancer target group"
  value       = aws_lb_target_group.application.arn
}

output "load_balancer_arn" {
  description = "The ARN of the load balancer"
  value       = aws_lb.application.arn
}