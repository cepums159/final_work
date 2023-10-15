terraform {
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "5.21.0"
    }
  }

  required_version = ">= 1.2.0"
}

provider "aws" {
  region  = "us-west-2"
}

resource "aws_vpc" "example_vpc" {
  cidr_block = "10.0.0.0/16"
}

resource "aws_subnet" "example_subnet" {
  vpc_id     = aws_vpc.example_vpc.id
  cidr_block = "10.0.1.0/24"
}

resource "aws_instance" "example_instance_2" {
  ami           = "ami-03f65b8614a860c29"
  instance_type = "t2.large"
  subnet_id     = aws_subnet.example_subnet.id

  tags = {
    Name = "Final_work_test_instance"
  }
}