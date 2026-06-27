resource "aws_instance" "roboshop" {
  ami           = "ami-0220d79f3f480ecf5"
  instance_type = "t3.micro"
  subnet_id     = "subnet-0edb98cdc31dc38cf"
  vpc_security_group_ids = ["sg-0b3d7f173c4ccc352"]
  
  tags = {
    Name = "MyTerraform"
    project = "roboshop"
  }
}