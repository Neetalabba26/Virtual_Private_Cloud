# Virtual_Private_Cloud using terraform
Personal project  
Designing the VPC as per the following requirements  
1. 1 public subnet
2. 2 private subnets
3. 1 private subnet has an RDS instance which is accessible by instances in the other private subnet.  
4. instances in the public subnet can communicate with instances in the private subnet  
5.instances in the public subnet cannot communicate with the RDS instance.  
