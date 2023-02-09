module "security_group_private" {
    source = "./security-group-private"
    Name_security_group_2 = "security_group-2"
    Ports_security_group = [22 , 0 , 80]
    Protocol_security_group = ["tcp" , "-1"] 
    cidr_security_group = "0.0.0.0/0"
    cidr_block_vpc = "10.0.0.0/16"
    vpcID = module.vpc.vpc-id
}