output "instance_id" {
  description = "ID vytvořené EC2 instance"
  value       = aws_instance.web.id
}

output "public_ip" {
  description = "Veřejná IP adresa EC2 instance"
  value       = aws_instance.web.public_ip
}

output "public_dns" {
  description = "Veřejný DNS název EC2 instance"
  value       = aws_instance.web.public_dns
}

output "ssh_command" {
  description = "Příkaz pro SSH připojení k instanci"
  value       = "ssh -i <public_key_path> ec2-user@${aws_instance.web.public_ip}"
}