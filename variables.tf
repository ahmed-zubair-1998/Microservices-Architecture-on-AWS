variable "profile" {
  type = string
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
  default     = 2
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
