output "instance_id" {
  description = "The ID of the instance"
  value       = aws_instance.this.id
}

output "instance_public_ip" {
  description = "The public IP address assigned to the instance"
  value       = aws_instance.this.public_ip
}

output "instance_private_ip" {
  description = "The private IP address assigned to the instance"
  value       = aws_instance.this.private_ip
}

