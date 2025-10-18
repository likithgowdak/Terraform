resource aws_instance my_instance {
  ami           = var.ami_id
  instance_type = var.instance_type

  provisioner "local-exec" {
    command = "echo Instance ${self.id} created with AMI ${var.ami_id} and type ${var.instance_type}"
  }
}
