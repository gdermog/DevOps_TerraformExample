output "mod_instance_id" {
  description = "ID vytvořené EC2 instance"
  value       = aws_instance.web.id
}

output "mod_public_ip" {
  description = "Veřejná IP adresa EC2 instance"
  value       = aws_instance.web.public_ip
}

output "mod_public_dns" {
  description = "Veřejný DNS název EC2 instance"
  value       = aws_instance.web.public_dns
}

output "mod_ssh_command" {
  description = "Příkaz pro SSH připojení k instanci"
  value       = "ssh -i <public_key_path> ec2-user@${aws_instance.web.public_ip}"
}