locals {
    instance_name = "${var.name}-${var.environment}"
    ami = "ami-0220d79f3f480ecf5" 
    instance_type = "t3.micro"
    common_tags = {
        name = "roboshop-demo"
        project = "roboshop"
        environment = "dev"
        terraform = true
    }
    ec2_final_tags = merge(local.common_tags, var.ec2_tags)

}
           