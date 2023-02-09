
resource "aws_nat_gateway" "nat-gateway" {
  allocation_id = var.allocationID
  subnet_id      = var.subnetID

  tags = {
    Name = var.Name_nat
  }
}
