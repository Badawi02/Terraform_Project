module "alb" {
  source       = "./ALB"
  alb_name     = "ALB"
  load_balancer_type   = "application"
  vpcID        = module.vpc.vpc-id
  subnetID     = ["${module.subnet.subnet-1-id}", "${module.subnet.subnet-2-id}"]
  secGroupId   = ["${module.security_group_public.security_group_id}"]
  targetGroupName = "TargetGroup1"
  instanceID_1 = module.ec2_public.public_ec2_1_id
  instanceID_2 = module.ec2_public.public_ec2_2_id
}







