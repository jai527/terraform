variable "environment" {
    default = "prod"
  
}

variable "ami_id" {
  type        = string
  default     = "ami-0220d79f3f480ecf5"
  description = "RHEL 9 Image"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
  description = "EC2 instance type"
}

variable "ec2_tags" {
  type = map(string)
  default = {
    Name        = "roboshop-demo"
    project     = "roboshop"
    terraform   = "true"
    environment = "dev"
  }
}

variable "my-security-group" {
    type = string
    default = "my-terraform"
  
}

variable "description" {
    type = string
    default = "Allow SSH and HTTP traffic"
  
}

variable "egress" {
    type = number
    default = 0

}

variable "ingress" {
    type = number
    default = 0
}

variable "cidr_blocks" {
    type = list 
    default =  ["0.0.0.0/0"]
}

variable "tags" {
    type = map
    default = {
        name = "roboshop-demo"
        project = "roboshop"
        terraform = "true"
        environment = "dev"
    }
}
