resource "aws_eip" "eip" {
  vpc      = true
  tags = {
    Name = var.Name_eip
  }
}

