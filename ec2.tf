resource "aws_instance" "database" {
  ami                    = "ami-0571c1aedb4b8c5fc"
  instance_type          = "t2.micro"
  subnet_id              = aws_subnet.private[0].id
  vpc_security_group_ids = [aws_security_group.database.id]
  private_ip             = var.database_private_ip
  key_name               = var.database_key_pair
  tags                   = { "Name" = "${var.default_tags.project}-database" }

  user_data = base64encode(templatefile("${path.module}/scripts/database.sh", {
    DATABASE_SERVICE_NAME = var.database_service_name
    DATABASE_MESSAGE      = var.database_message
  }))

  depends_on = [aws_nat_gateway.nat]
}
