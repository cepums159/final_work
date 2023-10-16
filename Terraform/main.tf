terraform {
  required_providers {
    aws = {
      source = "hashicorp/aws"
      version = "5.21.0"
    }
  }
}

provider "aws" {
  region = "us-west-2"
}

# Izveido VPC konfigurāciju
module "vpc" {
  source        = "./modules/vpc"
  vpc_id        = "vpc-0e2edd2eaeabb5a70"
  public_subnet = module.vpc.public_subnet
}

# Izveido EC2 instanci
resource "aws_instance" "example_instance" {
  ami           = "ami-03f65b8614a860c29"
  instance_type = "t2.large"
  vpc_security_group_ids = [module.vpc.default_security_group_id]
  subnet_id = module.vpc.public_subnet_id
  key_name      = "final-work-key"

  tags = {
    Name = "New-test-KRMV-instance"
  }
}