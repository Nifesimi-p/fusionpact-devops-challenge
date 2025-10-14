output "instance_public_ip" {
  description = "Public IP of EC2 instance"
  value       = aws_instance.app.public_ip
}

output "frontend_url" {
  description = "Frontend URL"
  value       = "http://${aws_instance.app.public_ip}"
}

output "backend_url" {
  description = "Backend API URL"
  value       = "http://${aws_instance.app.public_ip}:8000"
}

output "grafana_url" {
  description = "Grafana URL"
  value       = "http://${aws_instance.app.public_ip}:3000"
}

output "prometheus_url" {
  description = "Prometheus URL"
  value       = "http://${aws_instance.app.public_ip}:9090"
}