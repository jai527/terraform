resource "aws_instance" "example" {
  ami           = "ami-0220d79f3f480ecf5" 
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  tags = {
    Name = "MyTerraform"
    project = "roboshop"
  }
}

resource "aws_security_group" "my_sg" {
  name = "dynamic-sg"

  dynamic "ingress" {
    for_each = var.ingress_rules

    content {
      description      = ingress.value.description
      from_port        = ingress.value.from_port
      to_port          = ingress.value.to_port
      protocol         = ingress.value.protocol
      cidr_blocks      = ingress.value.cidr_blocks
      ipv6_cidr_blocks = ingress.value.ipv6_cidr_blocks
    }
  }

  tags = {
    Name = "MySecurityGroup"
  }
}