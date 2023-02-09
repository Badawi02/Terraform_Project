module "ec2_private" {
  source = "./ec2-private"
  instance_type = "t2.micro"
  associate_public_ip_address = "false"
  key_name = "ec2_key"
  subnetID = ["${module.subnet.subnet-3-id}","${module.subnet.subnet-4-id}"]
  secGroupId = ["${module.security_group_private.security_group_2_id}","${module.security_group_private.security_group_2_id}"]
  private_ec2_ = ["private_ec2_1","private_ec2_2"]
  user_data = "userData.tpl"
}