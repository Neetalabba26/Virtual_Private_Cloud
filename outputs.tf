output "vpc_id" {
  value = "${aws_vpc.test_vpc.id}"
}
output "gateway_id" {
  value = "${aws_internet_gateway.igw.id}"
}
output "subnet_id" {
  value = "${aws_subnet.public_subnet.id}"
}