output "vpc_id" {
  value = "${aws_vpc.test_vpc.id}"
}
output "gateway_id" {
  value = "${aws_internet_gateway.igw.id}"
}
output "public_subnet_id" {
  value = "${aws_subnet.public_subnet.id}"
}
output "private_subnet_1_id" {
  value = "${aws_subnet.private_subnet_1.id}"
}
output "security_group_id" {
  value = "${aws_security_group.sg_1.id}"
}
