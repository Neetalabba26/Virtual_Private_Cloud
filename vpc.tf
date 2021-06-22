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

resource "aws_route_table_association" "RT_association"
{
subnet_id = "${aws_subnet.pubblic_subnet.id}"
route_table_id = "${aws_route_table.RT.id}"
}

/*     ec2 instance     */

resource "aws_instance" "web_server"
{
    ami = "${var.instance_ami}"
    availability_zone = "us-east-1a"
    instance_type = "t2.micro"
    associate_public_ip_address = true
    subnet_id = "${aws_subnet.pubblic_subnet.id}"
    vpc_seurity_group_id = "${aws_security_group.sg_1.id}"
    tags{
        Name = "webserver"
    }
}

/*     security group     */

resource "aws_security_group" "sg_1" {
  name        = "sg_1
  vpc_id      = "${aws_vpc.test_vpc.id}"
  
  ingress {
    from_port        = 22
    to_port          = 22
    protocol         = "tcp"
    cidr_blocks      = [aws_vpc.test_vpc.cidr_block]
  }

  ingress {
      from_port      = 80
      to_port        = 80
      protocol       = "http"
      cidr_blocks    = [aws_vpc.test_vpc.cidr_block]
  }

  egress {
    from_port        = 0
    to_port          = 0
    protocol         = "-1"
    cidr_blocks      = ["0.0.0.0/0"]
  }

  tags = {
    Name = "sg_1"
  }
}
    

