# vars of private ec2
variable "instance_type" {
  type = string
}
variable "associate_public_ip_address" {
  type = string
}
variable "key_name" {
  type = string
}
variable "subnetID" {
    type = list
}
variable "secGroupId" {
    type = list
}
variable "private_ec2_" {
  type = list
}
variable "user_data" {
  type = string
}
