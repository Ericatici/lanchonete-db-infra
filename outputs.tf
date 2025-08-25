output "db_endpoint" {
  value       = aws_db_instance.lanchonete_db.endpoint
  description = "Endpoint of the RDS instance"
}
