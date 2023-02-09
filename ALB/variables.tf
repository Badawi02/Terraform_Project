

variable "load_balancer_type" {
  type = string
}
variable "alb_name" {
  type = string
}
variable "vpcID" {
  type = string
}
variable "subnetID" {
  type = list
}
variable "secGroupId" {
  type = list
}
variable "instanceID_1" {
  type = string
}
variable "instanceID_2" {
  type = string
}
variable "targetGroupName" {
  type = string
}
