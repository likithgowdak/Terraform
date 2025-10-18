# ------------------------------------------------------------
# Create a secure and production-ready S3 bucket using Terraform
# ------------------------------------------------------------
resource "aws_s3_bucket" "state_bucket" {

  # Globally unique bucket name
  bucket = "my-terraform-state-bucket-demo"   # ❗ change this to your own unique name

  # Access Control List: make the bucket private
  acl    = "private"

  # Enable versioning to preserve every version of an object (useful for recovering old state files)
  versioning {
    enabled = true
  }

  # Enable server-side encryption by default (SSE-S3)
  # This encrypts all objects automatically when they are stored in the bucket 
 server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"   # AWS-managed encryption
      }
    }
  }

  # Block all public access to ensure no accidental exposure
  # This is strongly recommended for state or sensitive data
  block_public_acls       = true
  block_public_policy     = true
  ignore_public_acls      = true
  restrict_public_buckets = true

  # Optional: Add lifecycle rule to clean up old object versions after 90 days
  # This saves storage cost while keeping recent history
  lifecycle_rule {
    id      = "cleanup-old-versions"
    enabled = true

    noncurrent_version_expiration {
      days = 90
    }
  }

  # Add tags to identify this bucket easily in AWS console
  tags = {
    Name        = "TerraformStateBucket"
    Environment = "Dev"
    Owner       = "Likith"
    ManagedBy   = "Terraform"
  }
}

# ------------------------------------------------------------
# Output section
# Prints the bucket name after Terraform apply
# ------------------------------------------------------------
output "bucket_name" {
  value = aws_s3_bucket.state_bucket.bucket
}
