variable "ami" {}
variable "instance_type" { default = "t2.micro" }
variable "subnet_id" {}
variable "key_name" {}
variable "name" {}
variable "user_data" { default = "" }
variable "bootstrap_local_path" { default = "../../provisioners/bootstrap.sh" }
variable "ssh_user" { default = "ec2-user" }
variable "private_key_path" { default = "~/.ssh/id_rsa" }