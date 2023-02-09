output "public_ec2_1_id" {
  value = aws_instance.instance[0].id
}
output "public_ec2_1_public_ip" {
  value = aws_instance.instance[0].public_ip
}
output "public_ec2_1_private_ip" {
  value = aws_instance.instance[0].private_ip
}
output "public_ec2_2_id" {
  value = aws_instance.instance[1].id
}
output "public_ec2_2_public_ip" {
  value = aws_instance.instance[1].public_ip
}
output "public_ec2_2_private_ip" {
  value = aws_instance.instance[1].private_ip
}