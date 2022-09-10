resource "aws_db_instance" "db_instance" {
  identifier             = "db-instance"
  instance_class         = "db.t3.micro"
  allocated_storage      = 5
  engine                 = "postgres"
  engine_version         = "13.7"
  username               = "root"
  password               = var.db_pwd
  db_subnet_group_name   = aws_db_subnet_group.db_subnet_group.name
  vpc_security_group_ids = [aws_security_group.rds.id]
  parameter_group_name   = aws_db_parameter_group.db_parameter_group.name
  publicly_accessible    = true
  skip_final_snapshot    = true
}