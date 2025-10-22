terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-demo"   # Same bucket name
    key            = "terraform/provisioner/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-state-lock"
    encrypt        = true
  }
}
