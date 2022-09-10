resource "aws_db_parameter_group" "db_parameter_group" {
  name   = "db-parameter-group"
  family = "postgres13"

  parameter {
    name  = "log_connections"
    value = "1"
  }
}