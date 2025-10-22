terraform {
  backend "s3" {
    bucket         = "my-terraform-state-likith"
    key            = "terraform/provisioner/terraform.tfstate" # path inside bucket
    region         = "ap-south-1"
    dynamodb_table = "terraform-locks"
    encrypt        = true
  }
}
