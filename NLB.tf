module "nlb" {
  source       = "./NLB"
  nlb_name     = "NLB"
  load_balancer_type   = "application"
  vpcID        = module.vpc.vpc-id
  subnetID     = ["${module.subnet.subnet-3-id}", "${module.subnet.subnet-4-id}"]
  secGroupId   = ["${module.security_group_private.security_group_2_id}"]
  targetGroupName = "TargetGroup2"
  instanceID_1 = module.ec2_private.private_ec2_1_id
  instanceID_2 = module.ec2_private.private_ec2_2_id
}







