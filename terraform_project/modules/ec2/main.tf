resource "aws_instance" "this" {
  ami                         = var.ami
  instance_type               = var.instance_type
  subnet_id                   = var.subnet_id
  associate_public_ip_address = true
  key_name                    = var.key_name
  tags = { Name = var.name }

  # simple user_data example (cloud-init)
  user_data = var.user_data

  # example provisioner: copy file then run bootstrap
  provisioner "file" {
    source      = var.bootstrap_local_path
    destination = "/tmp/bootstrap.sh"
  }

  provisioner "remote-exec" {
    inline = [
      "chmod +x /tmp/bootstrap.sh",
      "sudo /tmp/bootstrap.sh"
    ]

    connection {
      type        = "ssh"
      host        = self.public_ip
      user        = var.ssh_user
      private_key = file(var.private_key_path)
    }
  }
}
