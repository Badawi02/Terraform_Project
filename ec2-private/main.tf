data "aws_ami" "ubuntu" {
    most_recent = true
    filter {
        name   = "name"
        values = ["ubuntu/images/hvm-ssd/ubuntu-jammy-22.04-amd64-server-*"]
    }
    filter {
        name = "virtualization-type"
        values = ["hvm"]
    }
    owners = ["099720109477"]
}

resource "aws_instance" "instance" {
  count         = length(var.subnetID)
  instance_type = var.instance_type
  ami           = data.aws_ami.ubuntu.image_id
  subnet_id     = var.subnetID[count.index]
  key_name      = var.key_name
  vpc_security_group_ids = var.secGroupId
  associate_public_ip_address = var.associate_public_ip_address
  user_data = file(var.user_data)
   

  provisioner "local-exec" {
    command = "echo private_ec2_${count.index+1}: ${self.private_ip} >> allips.txt"
  }

  tags = {
    Name = var.private_ec2_[count.index]
  }

}

