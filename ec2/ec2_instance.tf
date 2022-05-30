provider "aws" {
  region = "us-east-1"
  profile = "msovani-vr"
}

locals {
  aws_key_name = "msovani"
  ami_id = "ami-0022f774911c1d690"
  instance_tags = {
    type = "terraform_test"
    env = "test"
  }
}

resource "aws_instance" "devtest" {
  ami           = local.ami_id
  instance_type = "t2.micro"
  key_name = local.aws_key_name
  tags = local.instance_tags
  count = 1
  user_data = <<EOF
              #!/bin/bash
              sudo yum update
              sudo yum install -y httpd
              EOF
}
output "instances" {
  value       = aws_instance.devtest[0].private_ip
  description = "PrivateIP address details"
}