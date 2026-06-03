output "aws_ami" {
    value = data.aws_ami.joindevops.id
  
}
output "instance_info_all_data" {
    value = data.aws_instance.MyTerraform
  
}