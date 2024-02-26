variable "alb_listener_port" {
  description = "The port for the ALB listener"
  type        = number
  default     = 80
  
}

variable "alb_listener_protocol" {
  description = "The protocol for the ALB listener"
  type        = string
  default     = "HTTP" 
}

variable "alb_target_group_port" {
  description = "The port for the ALB target group"
  type        = number
  default     = 80
}

variable "alb_target_group_protocol" {
  description = "The protocol for the ALB target group"
  type        = string
  default     = "HTTP"
}

variable "alb_health_check_path" {
  description = "The path for the ALB health check"
  type        = string
  default     = "/"
}

variable "alb_health_check_timeout" {
  description = "The timeout for the ALB health check"
  type        = number
  default     = 5
}

variable "alb_health_check_interval" {
  description = "The interval for the ALB health check"
  type        = number
  default     = 30
}

variable "alb_health_check_healthy_threshold" {
  description = "The healthy threshold for the ALB health check"
  type        = number
  default     = 2
}

variable "alb_health_check_unhealthy_threshold" {
  description = "The unhealthy threshold for the ALB health check"
  type        = number
  default     = 2
}

variable "alb_health_check_matcher" {
  description = "The matcher for the ALB health check"
  type        = string
  default     = "200-399"
}

variable "alb_name" {
  description = "The name of the ALB"
  type        = string
  default     = "my-alb"
}

variable "alb_target_group_name" {
  description = "The name of the ALB target group"
  type        = string
  default     = "my-target-group"
  
}

variable "alb_internal" {
  description = "Boolean to create an internal ALB"
  type        = bool
  default     = false
}

variable "alb_security_group_id" {
  description = "The security group ID for the ALB"
  type        = string
}

variable "alb_subnet_ids" {
  description = "The subnet IDs for the ALB"
  type        = list(string)
}

variable "alb_deletion_protection" {
  description = "Boolean to enable deletion protection for the ALB"
  type        = bool
  default     = false
}

