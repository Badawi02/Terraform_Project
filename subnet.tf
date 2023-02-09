module "subnet" {
    source = "./subnet"
    vpcId = module.vpc.vpc-id
    subnet_cidr = ["10.0.0.0/24", "10.0.1.0/24" , "10.0.2.0/24", "10.0.3.0/24"]
    azs = ["us-east-1a", "us-east-1b", "us-east-1c", "us-east-1d"]
}