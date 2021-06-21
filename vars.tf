variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/24"
}

variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.0.0/25"
}

variable "private_subnet_1_cidr" {
    description = "CIDR for the Private Subnet 1"
    default = "10.0.0.128/26"
}

variable "private_subnet_2_cidr" {
    description = "CIDR for the Private Subnet 2"
    default = "10.0.0.192/26"
}
