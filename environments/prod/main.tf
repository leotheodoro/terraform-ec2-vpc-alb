provider "aws" {
  region = "us-east-2"
  profile = "AdministratorAccess-637423306057"
}

module "vpc" {
  source = "../../modules/vpc"
  environment = "prod"
}

module "ec2" {
  source = "../../modules/ec2"
  environment = "prod"
  instance_type = "t2.micro"
}

module "alb" {
  source = "../../modules/alb"
  environment = "prod"
}
