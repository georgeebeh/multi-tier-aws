resource "aws_db_instance" "default" {
  allocated_storage    = var.allocated_storage
  db_name              = var.db_name
  engine               = var.db_engine
  instance_class       = var.db_instance_type
  manage_master_user_password = true
  username             = var.db_username
  password             = var.db_password
  skip_final_snapshot  = true
}