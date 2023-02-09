output "private_ec2_1_id" {
  value = aws_instance.instance[0].id
}
output "private_ec2_1_private_ip" {
  value = aws_instance.instance[0].private_ip
}
output "private_ec2_2_id" {
  value = aws_instance.instance[1].id
}
output "private_ec2_2_private_ip" {
  value = aws_instance.instance[1].private_ip
}
