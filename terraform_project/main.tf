module "vpc" {
  source = "./modules/vpc"
  name   = var.project_name
  cidr_block = var.vpc_cidr
  public_subnets_cidrs = var.public_subnets
  azs = var.azs
}

resource "aws_security_group" "bastion" {
  name   = "${var.project_name}-bastion-sg"
  vpc_id = module.vpc.vpc_id

  ingress {
    from_port   = 22
    to_port     = 22
    protocol    = "tcp"
    cidr_blocks = [var.my_ip_cidr]  # your IP
  }

  egress {
    from_port   = 0
    to_port     = 0
    protocol    = "-1"
    cidr_blocks = ["0.0.0.0/0"]
  }
}


module "ec2" {
  source = "./modules/ec2"
  name   = "${var.project_name}-instance"
  ami    = var.ami
  instance_type = var.instance_type
  subnet_id = module.vpc.public_subnet_ids[0]
  key_name  = var.key_name
  bootstrap_local_path = var.bootstrap_local_path
  ssh_user  = var.ssh_user
  private_key_path = var.private_key_path
}
