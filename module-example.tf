# Příklad použití modulu EC2 instance

module "ec2_instance" {
  source = "./modules/ec2-instance"

  mod_public_key  = var.public_key
  mod_name_prefix = var.name_prefix
  mod_environment = var.environment
  mod_course_name = var.course_name

  mod_user_data = <<-EOF
    #!/bin/bash
    yum update -y
    yum install -y mc
    yum install -y httpd
    systemctl start httpd
    systemctl enable httpd
    echo "<html><body><h1>Terraform EC2 Instance</h1><p>Vytvořeno pomocí Terraform pro ${var.course_name}, jako modul</p></body></html>" > /var/www/html/index.html
  EOF

  mod_additional_tags   = {
    Module = "true"
  }

}

# Výstupy pro modul
output "instance_id" {
  description = "ID vytvořené EC2 instance z modulu"
  value       = module.ec2_instance.mod_instance_id
}

output "public_ip" {
  description = "Veřejná IP adresa EC2 instance z modulu"
  value       = module.ec2_instance.mod_public_ip
}

output "ssh_command" {
  description = "Příkaz pro SSH připojení k instanci vytvořené modulem"
  value       = "ssh -i <public_key_path> ec2-user@${module.ec2_instance.mod_public_ip}"
}
