output "instance_id" {
  description = "EC2 instance ID"
  value       = aws_instance.app.id
}

output "public_ip" {
  description = "Public IP of the EC2 instance"
  value       = aws_instance.app.public_ip
}

output "public_dns" {
  description = "Public DNS of the EC2 instance"
  value       = aws_instance.app.public_dns
}

output "public_endpoint" {
  description = "Public API endpoint"
  value       = var.public_port == 80 ? "http://${aws_instance.app.public_ip}/api/users" : "http://${aws_instance.app.public_ip}:${var.public_port}/api/users"
}

output "image_deployed" {
  description = "Image deployed on EC2"
  value       = "${var.image_name}:${var.image_tag}"
}
