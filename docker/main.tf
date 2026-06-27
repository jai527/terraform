# ✅ VPC
resource "aws_vpc" "my_vpc" {
  cidr_block = "10.0.0.0/16"
}

# ✅ Internet Gateway
resource "aws_internet_gateway" "igw" {
  vpc_id = aws_vpc.my_vpc.id
}

# ✅ Subnet (Public)
resource "aws_subnet" "public_subnet" {
    vpc_id                  = aws_vpc.my_vpc.id
    cidr_block              = "10.0.1.0/24"
    availability_zone       = "us-east-1a"
    map_public_ip_on_launch = true
}

# ✅ Route Table
resource "aws_route_table" "rt" {
  vpc_id = aws_vpc.my_vpc.id
}

# ✅ Route to Internet
resource "aws_route" "route" {
  route_table_id         = aws_route_table.rt.id
  destination_cidr_block = "0.0.0.0/0"
  gateway_id             = aws_internet_gateway.igw.id
}

# ✅ Associate Route Table
resource "aws_route_table_association" "assoc" {
  subnet_id      = aws_subnet.public_subnet.id
  route_table_id = aws_route_table.rt.id
}

# ✅ Security Group (ONLY SSH)
resource "aws_security_group" "sg" {
  name   = "ssh-only-sg"
  vpc_id = aws_vpc.my_vpc.id

  ingress {
    description = "SSH Access"
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = ["0.0.0.0/0"]
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}

# ✅ EC2 (Docker + /var extend)
resource "aws_instance" "docker_ec2" {
  ami           = local.ami_id
  instance_type = var.instance_type
  subnet_id              = aws_subnet.public_subnet.id
  vpc_security_group_ids = [aws_security_group.sg.id]
  associate_public_ip_address = true

  root_block_device {
    volume_size = 50
  }

  user_data = <<-EOF
user_data = <<-EOF
#!/bin/bash

yum update -y

# Install Docker (simple & reliable)
yum install -y docker
systemctl start docker
systemctl enable docker
usermod -aG docker ec2-user

# Install LVM tools
yum install -y lvm2 cloud-utils-growpart

# Extend disk
growpart /dev/nvme0n1 4
pvresize /dev/nvme0n1p4

# Remove /home (only if empty)
lvremove -y /dev/RootVG/homeVol

# Extend /var
lvextend -r -L +30G /dev/RootVG/varVol

EOF

  tags = {
    Name = "Docker-EC2"
  }
}