data "aws_ami" "joindevops" {
  most_recent = true

  owners = ["973714476881"]

  filter {
    name   = "name"
    values = ["Redhat-9-DevOps-Practice"]
  }
}

data "aws_instance" "MyTerraform" {
    instance_id = "i-0229b970b4c6bf7f0" 
  
}