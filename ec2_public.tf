module "ec2_public" {
  source = "./ec2-public"
  instance_type = "t2.micro"
  associate_public_ip_address = "true"
  key_name = "ec2_key"
  subnetID = ["${module.subnet.subnet-1-id}","${module.subnet.subnet-2-id}"]
  secGroupId = ["${module.security_group_public.security_group_id}","${module.security_group_public.security_group_id}"]
  public_ec2_ = ["public_ec2_1","public_ec2_2"]
  network-load-balancer-dns = module.nlb.nlb_arn
}