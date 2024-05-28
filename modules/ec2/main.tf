resource "aws_instance" "app" {
  count         = var.instance_count
  ami           = var.ami_id
  instance_type = var.instance_type
  subnet_id     = element(var.public_subnet_ids, count.index)

  tags = {
    Name = "${var.environment}-app-${count.index}"
  }
}
