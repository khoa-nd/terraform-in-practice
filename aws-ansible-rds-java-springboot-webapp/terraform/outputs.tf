output "rds_hostname" {
  description = "RDS instance hostname"
  value       = aws_db_instance.db_instance.address
}

output "rds_port" {
  description = "RDS instance port"
  value       = aws_db_instance.db_instance.port
}

output "rds_username" {
  description = "RDS instance username"
  value       = aws_db_instance.db_instance.username
}

output "ec2_ip" {
  description = "EC2 instance public ip"
  value       = aws_instance.instance.public_ip
}

