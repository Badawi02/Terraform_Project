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
   provisioner "remote-exec" {
    inline = [
      "sudo apt-get update -y",
      "sudo apt-get upgrade -y",
      "sudo apt-get install nginx -y",
      "sudo unlink /etc/nginx/sites-enabled/default",
      "cd /etc/nginx/sites-available/",
      "sudo touch reverse-proxy.conf",
      "echo 'server {\nlisten 80 default_server;\nlisten [::]:80 default_server;\nserver_name _;\nlocation / {\nproxy_pass ${var.network-load-balancer-dns};\n}\n}' > reverse-proxy.conf",
      "sudo ln -s /etc/nginx/sites-available/reverse-proxy.conf /etc/nginx/sites-enabled/reverse-proxy.conf",
      "sudo service nginx configtest",
      "sudo service nginx restart"
    ]

    connection {
      host        = self.public_ip
      type        = "ssh"
      user        = "ubuntu"
      private_key = file("ec2_key.pem")
      timeout = "1m"
    }

   }

  provisioner "local-exec" {
    command = "echo public_ec2_${count.index+1}: ${self.public_ip} >> allips.txt"
  }

  tags = {
    Name = var.public_ec2_[count.index]
  }

}