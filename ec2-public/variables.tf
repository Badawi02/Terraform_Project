# vars of public ec2
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
variable "public_ec2_" {
  type = list
}
variable "network-load-balancer-dns" {
  type = string
}
