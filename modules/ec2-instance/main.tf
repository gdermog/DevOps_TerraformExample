# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.mod_public_key
}

# Security group pro SSH přístup
resource "aws_security_group" "ec2_sg" {
  name        = "${var.mod_name_prefix}-sg"
  description = "Security group pro EC2 instanci s SSH pristupem"

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "SSH pristup"
  }

  # Přidáme HTTP port pro bonus ukol s Apache
  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
    description = "HTTP pristup"
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    description = "Povoleni veskereho odchoziho provozu"
  }

  tags = {
    Name        = "${var.mod_name_prefix}-sg"
    Environment = var.mod_environment
    Course      = var.mod_course_name
  }
}

resource "aws_instance" "web" {
  ami           = "ami-0c1b03e30bca3b373"
  instance_type = "t3.micro"
  key_name      = aws_key_pair.deployer.key_name
  vpc_security_group_ids = [aws_security_group.ec2_sg.id]

  user_data = var.mod_user_data
  
  tags = merge({
    Name = "HelloWorldModule"
    Environment = var.mod_environment
	Course = var.mod_course_name
   },
   var.mod_additional_tags
  )
}

