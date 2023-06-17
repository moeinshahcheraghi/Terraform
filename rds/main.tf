resource "aws_db_instance" "default" {
  allocated_storage      = 10
  engine                 = var.engine
  engine_version         = var.engine_version
  instance_class         = var.instance_class
  db_name                = var.name
  username               = var.username
  password               = var.password
  parameter_group_name   = var.parameter_group_name
  vpc_security_group_ids = ["${aws_security_group.rds_sg.id}"]
  skip_final_snapshot    = true
  publicly_accessible    = true
}