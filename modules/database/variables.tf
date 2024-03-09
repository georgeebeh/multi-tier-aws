variable "db_username" {
  description = "The username for the database"
  type        = string
  sensitive = true
  
}

variable "db_password" {
  description = "The password for the database"
  type        = string
  sensitive = true
  
}

variable "db_instance_type" {
  description = "The instance type for the database"
  type        = string
  default     = "db.t2.micro"
  
}

variable "db_engine" {
  description = "The database engine to use"
  type        = string
  default     = "mysql"
  
}

variable "db_name" {
  description = "The name of the database"
  type        = string
  default     = "mydb"
  
}

variable "env_prefix" {
  description = "The prefix to use for the environment"
  type        = string
  default     = "dev"
  
}

variable "allocated_storage" {
  description = "The amount of storage to allocate for the database"
  type        = number
  default     = 10
  
}