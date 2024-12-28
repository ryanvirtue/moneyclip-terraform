output "db_host" {
  description = "RDS instance hostname"
  value       = aws_db_instance.postgres.address
  sensitive   = true
} 