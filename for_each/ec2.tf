resource "aws_instance" "example" {
  #for_each = var.instance
  for_each = toset(var.instance)
  ami           = "ami-0220d79f3f480ecf5" 
  #instance_type = each.value
  instance_type = "t3.micro"
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  tags = {
    Name = each.key
    project = "roboshop"
  }
}

resource "aws_security_group" "my_sg" {
  name        = "my-security-group"
  description = "Allow SSH and HTTP traffic"

  ingress {
    description = "Allow SSH"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"] 
  }

  egress {
    description = "Allow all outbound"
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
    ipv6_cidr_blocks = ["::/0"] 
  }

  tags = {
    Name = "MySecurityGroup"
  }
}