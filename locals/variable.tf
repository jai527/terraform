variable "name" {
    type = string
    default = "locals"
  
}

variable "environment" {
    type = string
    default = "dev"
  
}

variable "sg_tags" {
    
    default = {
        name = "function-demo"
        environment = "prod"
    
    }
  
}

variable "ec2_tags" {
    
    default = {
        name = "function1-demo"
        environment = "prod"
    
    }
  
}

