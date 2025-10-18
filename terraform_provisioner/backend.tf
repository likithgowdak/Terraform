terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket"     # Replace with your bucket name
    key            = "state/terraform.tfstate"
    region         = "ap-south-1"
    dynamodb_table = "terraform-lock-table"
    encrypt        = true
  }
}
