provider "aws" {
  region  = "us-east-2"
  profile = "AdministratorAccess-637423306057"
}

module "vpc" {
  source         = "../../modules/vpc"
  environment    = var.environment
  cidr_block     = var.cidr_block
  public_subnets = var.public_subnets
  private_subnets = var.private_subnets
}

resource "aws_security_group" "alb_sg" {
  name        = "${var.environment}-alb-sg"
  description = "Security group for ALB"
  vpc_id      = module.vpc.vpc_id

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
    Name = "${var.environment}-alb-sg"
  }
}

module "ec2" {
  source        = "../../modules/ec2"
  environment   = var.environment
  instance_type = var.instance_type
  ami_id        = var.ami_id
  instance_count = var.instance_count
  public_subnet_ids = module.vpc.public_subnet_ids
}

module "alb" {
  source         = "../../modules/alb"
  environment    = var.environment
  security_groups = [aws_security_group.alb_sg.id]
  public_subnet_ids = module.vpc.public_subnet_ids
  vpc_id = module.vpc.vpc_id
}