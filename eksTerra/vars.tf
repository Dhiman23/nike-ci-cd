variable "vpc_cidr" {
  description = "VPC CIDR"
  type = string
}

variable "public_subnets" {
  description = "public_subnets CIDR"
  type = list(string)
}

variable "private_subnets" {
  description = "private_subnets CIDR"
  type = list(string)
}

variable "instance_types" {
  description = "Node I"
  type = list(string)
}