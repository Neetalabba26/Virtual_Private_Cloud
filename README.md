# Virtual_Private_Cloud using terraform
Personal project 
Designing the VPC as per the following requirements
a. 1 public subnet
b. 2 private subnets
i. 1 private subnet has an RDS instance which is accessible by instances in the other private subnet.
ii. instances in the public subnet can communicate with instances in the private subnet
iii.instances in the public subnet cannot communicate with the RDS instance.
