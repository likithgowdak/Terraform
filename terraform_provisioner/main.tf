resource "aws_instance" "my_instance" {
  ami           = var.ami_id
  instance_type = var.instance_type
  key_name      = var.key_name

  tags = {
    Name = "TerraformProvisionedEC2"
  }

  # ------------------------------------------------------------
  # Provisioner: Create folders after EC2 is ready
  # ------------------------------------------------------------
  provisioner "remote-exec" {
    inline = [
      "mkdir -p /home/ec2-user/provisioner/folder1",
      "mkdir -p /home/ec2-user/provisioner/folder2",
      "mkdir -p /home/ec2-user/provisioner/folder3",
      "mkdir -p /home/ec2-user/provisioner/folder4",
      "mkdir -p /home/ec2-user/provisioner/folder5",
      "echo 'Provisioning completed!'"
    ]

    connection {
      type        = "ssh"
      user        = "ec2-user"
      private_key = file("~/.ssh/my-keypair.pem")
      host        = self.public_ip
    }
  }
}
