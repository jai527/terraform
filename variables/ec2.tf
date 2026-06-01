resource "aws_instance" "example" {
  ami           = var.ami_id 
  instance_type = var.instance_type
  vpc_security_group_ids = [aws_security_group.my_sg.id]

  tags = var.ec2_tags
}

resource "aws_security_group" "my_sg" {
  name        = var.my-security-group
  description = var.description

  ingress {
    description = "Allow SSH"
    from_port   = var.ingress
    to_port     = var.ingress
    protocol    = "-1"
    cidr_blocks = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"] 
  }

  egress {
    description = "Allow all outbound"
    from_port   = var.egress
    to_port     = var.egress
    protocol    = "-1"
    cidr_blocks = var.cidr_blocks
    ipv6_cidr_blocks = ["::/0"] 
  }

  tags = {
    Name = "MySecurityGroup"
  }
}