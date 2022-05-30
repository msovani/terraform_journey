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

resource "aws_instance" "example" {
  ami           = local.ami_id
  instance_type = "t2.micro"
  key_name = local.aws_key_name
  tags = local.instance_tags
}
