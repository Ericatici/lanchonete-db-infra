output "db_endpoint" {
  value       = aws_db_instance.lanchonete_db.address
  description = "Endpoint of the RDS instance"
}

output "db_port" {
  value       = aws_db_instance.lanchonete_db.port
  description = "Port of the RDS instance"
}

output "db_username" {
  value       = aws_db_instance.lanchonete_db.username
  description = "Username for the RDS instance"
}

output "db_name" {
  value       = aws_db_instance.lanchonete_db.db_name
  description = "Database name for the RDS instance"
}

output "db_instance_arn" {
  value       = aws_db_instance.lanchonete_db.arn
  description = "ARN of the RDS instance"
}
