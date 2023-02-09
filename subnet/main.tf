resource "aws_subnet" "subnet" {
  count      = length(var.subnet_cidr)
  vpc_id     = var.vpcId
  cidr_block = var.subnet_cidr[count.index]
  availability_zone = var.azs[count.index]
  map_public_ip_on_launch = true
  tags = {
    Name = "Subnet-${count.index+1}"
  }
}