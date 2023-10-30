locals {
  public_cidr_blocks = [for i in range(var.public_subnet_count) : cidrsubnet(var.cidr_block, 4, i)]
  private_cidr_blocks = [for i in range(var.private_subnet_count) : cidrsubnet(var.cidr_block, 4, i+var.public_subnet_count)]
  server_private_ips = [for i in local.private_cidr_blocks : cidrhost(i, 250)]
}