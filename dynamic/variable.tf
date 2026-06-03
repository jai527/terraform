variable "ingress_rules" {
    default = [
    {
      description       = "Allow SSH"
      from_port         = 22
      to_port           = 22
      protocol          = "tcp"
      cidr_blocks       = ["0.0.0.0/0"]
      ipv6_cidr_blocks  = ["::/0"]
    },
    {
      description       = "Allow HTTPS"
      from_port         = 443
      to_port           = 443
      protocol          = "tcp"
      cidr_blocks       = ["0.0.0.0/0"]
      ipv6_cidr_blocks  = ["::/0"]
    },
    {
      description       = "Allow MySQL"
      from_port         = 3306
      to_port           = 3306
      protocol          = "tcp"
      cidr_blocks       = ["0.0.0.0/0"]
      ipv6_cidr_blocks  = ["::/0"]
    }
  ]
}