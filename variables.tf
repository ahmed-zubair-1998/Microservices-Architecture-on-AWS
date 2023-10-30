variable "profile" {
  type        = string
  description = "AWS profile associated with credentials"
}

variable "region" {
  type        = string
  description = "AWS Region to create your resources in"
  default     = "us-west-2"
}

variable "cidr_block" {
  type        = string
  description = "Default CIDR block for VPC"
  default     = "10.255.0.0/20"
}

variable "default_tags" {
  type        = map(string)
  description = "Map of default tag for our project"
  default = {
    "project" = "AWS-Hashi-Project"
  }
}

variable "public_subnet_count" {
  type        = number
  description = "Count of public subnets to be created"
  default     = 2
}

variable "private_subnet_count" {
  type        = number
  description = "Count of private subnets to be created"
  default     = 3
}

variable "database_private_ip" {
  type        = string
  description = "Private IP for Database EC2 instance"
}

variable "database_key_pair" {
  type        = string
  description = "Key pair for Database EC2 instance"
}

variable "database_service_name" {
  type        = string
  description = "EC2 Database service name"
  default     = "database"
}

variable "database_message" {
  type        = string
  description = "EC2 Database message"
  default     = "Hello from Database"
}

variable "consul_server_count" {
  type        = number
  description = "Count of EC2 instances for Consul server"
  default     = 3
}

variable "consul_server_key_pair" {
  type        = string
  description = "Key pair for Consul server EC2 instance"
}

variable "consul_server_allowed_cidr_blocks" {
  type        = list(string)
  description = "List of valid IPv4 CIDR blocks that can access the consul servers from the public internet."
  default     = ["0.0.0.0/0"]
}

variable "consul_server_allowed_cidr_blocks_ipv6" {
  type        = list(string)
  description = "List of valid IPv6 CIDR blocks that can access the consul servers from the public internet."
  default     = ["::/0"]
}

variable "consul_dc1_name" {
  type        = string
  description = "Name of Consul datacentre"
  default     = "dc1"
}
