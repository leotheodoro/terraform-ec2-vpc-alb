variable "environment" {
  description = "The environment to deploy (dev, staging, prod)"
  type        = string
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
}

variable "ami_id" {
  description = "AMI ID for the EC2 instances"
  type        = string
}

variable "instance_count" {
  description = "Number of instances to launch"
  type        = number
}

variable "public_subnet_ids" {
  description = "List of public subnet IDs"
  type        = list(string)
}
