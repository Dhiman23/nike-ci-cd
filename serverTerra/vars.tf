variable "ports" {
  type    = list(number)
  default = [3000, 8080, 9000, 80, 22, 8000]
}

variable "server" {
  default = "t2.large"
}

variable "ami" {
  default = "ami-04a81a99f5ec58529"
}

variable "sg-name" {}
variable "vm-name" {
  description = "Name of the virtual machine"
  type        = string
}