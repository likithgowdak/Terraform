variable "project_name" { default = "myproject" }
variable "aws_region" { default = "ap-south-1" }
variable "vpc_cidr" { default = "10.0.0.0/16" }
variable "public_subnets" { default = ["10.0.1.0/24", "10.0.2.0/24"] }
variable "azs" { default = ["ap-south-1a", "ap-south-1b"] }
variable "ami" {}
variable "instance_type" { default = "t2.micro" }
variable "key_name" {}
variable "bootstrap_local_path" { default = "provisioners/bootstrap.sh" }
variable "ssh_user" { default = "ec2-user" }
variable "private_key_path" { default = "~/.ssh/id_rsa" }
variable "my_ip_cidr" { default = "0.0.0.0/0" } # replace with your IP/cidr for security
