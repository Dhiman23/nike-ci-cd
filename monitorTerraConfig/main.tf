resource "aws_security_group" "web-sg" {
  dynamic "ingress" {
    for_each = var.ports
    content {
      from_port   = ingress.value
      to_port     = ingress.value
      protocol    = "tcp"
      cidr_blocks = ["0.0.0.0/0"]
    }

  }
  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]

  }
  tags = {
    Name = "${var.sg-name}-sg"
  }

}

resource "aws_instance" "server" {
  ami             = var.ami
  instance_type   = var.server
  security_groups = [aws_security_group.web-sg.name]
  key_name        = "server-key"
  user_data       = templatefile("./ansible.sh", {})
  root_block_device {
    volume_size = 25
    volume_type = "gp3"
  }
  tags = {
    Name = "${var.vm-name}"
  }

  associate_public_ip_address = true

}