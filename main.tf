# Configure the AWS Provider
provider "aws" {
  region = "eu-central-1"
}

resource "aws_key_pair" "deployer" {
  key_name   = "deployer-key"
  public_key = var.public_key
}

resource "aws_instance" "web" {
  ami           = "ami-0c1b03e30bca3b373"
  instance_type = "t3.micro"
  key_name = aws_key_pair.deployer.key_name

  tags = {
    Name = "HelloWorld"
    Environment = "development"
	Course = "DevOps"
  }
}

