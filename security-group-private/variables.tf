
# vars of security group 2
variable "Name_security_group_2" {
  type = string
}
variable "Ports_security_group" {
  type = list
}
variable "Protocol_security_group" {
  type = list
}
variable "cidr_security_group" {
  type = string
}
variable "cidr_block_vpc" {
  type = string
}

variable "vpcID" {
  type = string
}