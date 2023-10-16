# Ievada eksistējošā VPC konfigurāciju
variable "vpc_id" {
  type        = string
  description = "Eksistējošā VPC ID"
}

variable "public_subnet" {
  type        = string
  description = "Eksistējošā publiskā subnet ID"
}

# Atgriež eksistējošā VPC konfigurāciju
output "vpc_id" {
  value = var.vpc_id
}

output "public_subnet" {
  value = aws_subnet.public.id
}

output "public_subnet_id" {
  value = var.public_subnet
}

output "default_security_group_id" {
  value = aws_security_group.default.id
}

# Iegūst eksistējošo VPC konfigurāciju
data "aws_vpc" "selected" {
  id = var.vpc_id
}

# Izveido publisko subnet konfigurāciju
resource "aws_subnet" "public" {
  vpc_id     = data.aws_vpc.selected.id
  cidr_block = "172.31.66.0/24"
  tags = {
    Name = "Public Subnet KRMV"
  }
}

# Izveido default security group
resource "aws_security_group" "default" {
  name_prefix = "default_sg_"
  vpc_id      = var.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }
  ingress {
    from_port   = 443
    to_port     = 443
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

   ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }

  tags = {
    Name = "Default KRMV Security Group"
  }
}
