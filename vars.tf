variable "vpc_cidr" {
    description = "CIDR for the whole VPC"
    default = "10.0.0.0/24"
}

variable "public_subnet_cidr" {
    description = "CIDR for the Public Subnet"
    default = "10.0.0.0/25"
}

variable "public_subnet_ip" {
    description = "assign public ip to the instance launched into the subnet"
    type = bool
    default  = true
}
    
variable "private_subnet_1_cidr" {
    description = "CIDR for the Private Subnet 1"
    default = "10.0.0.128/26"
}

variable "private_subnet_2_cidr" {
    description = "CIDR for the Private Subnet 2"
    default = "10.0.0.192/26"
}

variable "public_instance_ami" {
    description = "id of the ami used"
    default = "ami-0211d10fb4a04824a"
}

variable "private_instance_ami_1" {
    description = "id of the ami used"
    default = "ami-0211d10fb4a04824a"
}
