resource "aws_instance" "example" {
  ami           = local.ami
  instance_type = local.instance_type
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  tags = local.ec2_final_tags
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