variable "environment" {
  description = "The environment to deploy (dev, staging, prod)"
  type        = string
}

variable "security_groups" {
  description = "List of security groups to assign to the ALB"
  type        = list(string)
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}

variable "vpc_id" {
  description = "ID of the VPC"
  type        = string
}
