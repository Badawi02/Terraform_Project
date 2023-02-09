module "nat_getway" {
    source = "./nat_getway"
    allocationID = module.eip.eip-id
    subnetID = module.subnet.subnet-1-id
    Name_nat = "nat-getway"
}