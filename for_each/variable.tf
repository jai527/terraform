#Map
/* variable "instance" {
  type = map
  default = {
    mongodb = "t3.micro"                         #key = valves
    catalouge = "t3.small"
    redis = "t3.small"
  }
} */


# this should be converted in to set
variable "instance" {
    type = list(string)
    default = ["catalogue", "mongodb",]
}

variable "zone_id" {
  default = "Z005336437MHJ16KCQQI8"
}

variable "domain_name" {
  default = "jai01.online"
}