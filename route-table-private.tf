module "route-table-private" {
  source = "./route-table-private"
  vpcID = module.vpc.vpc-id
  ngwID = module.nat_getway.nat-id
  Name_route_table = "route-table-private"
  subnetID = module.subnet.subnet-3-id
  subnetID2 = module.subnet.subnet-4-id
  cidr_block_route_table = "0.0.0.0/0"
}