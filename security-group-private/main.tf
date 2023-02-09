resource "aws_security_group" "allow_tls_2" {
  name        = var.Name_security_group_2
  vpc_id      = var.vpcID

  ingress {
    from_port        = var.Ports_security_group[0]
    to_port          = var.Ports_security_group[0]
    protocol         = var.Protocol_security_group[0]
    cidr_blocks      = [ var.cidr_block_vpc ]
  }

  ingress {
    from_port        = var.Ports_security_group[2]
    to_port          = var.Ports_security_group[2]
    protocol         = var.Protocol_security_group[0]
    cidr_blocks      = [ var.cidr_block_vpc ]
  }

  egress {
    from_port        = var.Ports_security_group[1]
    to_port          = var.Ports_security_group[1]
    protocol         = var.Protocol_security_group[1]
    cidr_blocks      = [ var.cidr_security_group ]
  }

}