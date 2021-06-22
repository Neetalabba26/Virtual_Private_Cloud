resource "aws_vpc" "test_vpc" {
    cidr_block = "${var.vpc_cidr}"
    tenancy = "default"
    tags = {
        Name = "test_vpc"
    }
}

resource "aws_internet_gateway" "igw"
{
  vpc_id = "${aws_vpc.test_vpc.id}"
}

/*     public_subnet     */

resource "aws_subnet" "public_subnet"
{
  vpc_id = "${aws_vpc.test_vpc.id}"
  cidr_block = "${var.public_subnet_cidr}"
  availability_zone = "us-east-1a"
  tags = {
    Name = "public_subnet"
  }
}

/*     private_subnet_1     */

resource "aws_subnet" "private_subnet_1"
{
  vpc_id = "${aws_vpc.test_vpc.id}"
  cidr_block = "${var.private_subnet_1_cidr}"
  availability_zone = "us-east-1b"
  tags = {
    Name = "private_subnet_1"
  }
} 

/*     private_subnet_2     */

resource "aws_subnet" "private_subnet_2"
{
  vpc_id = "${aws_vpc.test_vpc.id}"
  cidr_block = "${var.private_subnet_2_cidr}"
  availability_zone = "us-east-1b"
  tags = {
    Name = "private_subnet_2"
  }
} 

/*     route table     */

resource "aws_route_table" "RT" {
    vpc_id = "${aws_vpc.test_vpc.id}"

    route {
        cidr_block = "0.0.0.0/0"
        gateway_id = "${aws_internet_gateway.igw.id}"
    }

    tags = {
        Name = "Public Subnet 1 route table"
    }
}

/*     route table association     */

resource "aws_route_table_association" 'RT_association"
{
subnet_id = "${aws_subnet.pubblic_subnet.id}"
route_table_id = "${aws_route_table.RT.id}"
}

