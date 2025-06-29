# dynamodb-s3-backend.tf

provider "aws" {
  region = "us-east-1"
}

# S3 Bucket for Terraform State
resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-terraform-state-bucket" # Make sure this is unique globally

  versioning {
    enabled = true
  }

  server_side_encryption_configuration {
    rule {
      apply_server_side_encryption_by_default {
        sse_algorithm = "AES256"
      }
    }
  }
  tags = {
    Name        = "Terraform-State-Bucket"
    Environment = "Production"
  }
}

# DynamoDB Table for State Lock
resource "aws_dynamodb_table" "terraform_locks" {
  name         = "terraform-locks"
  billing_mode = "PAY_PER_REQUEST"

  # Define Primary Key
  hash_key = "LockID"  # This specifies 'LockID' as the Partition Key

  attribute {
    name = "LockID"
    type = "S"     # 'S' indicates that the attribute type is a String
  }

  tags = {
    Name        = "Terraform-Locks"
    Environment = "Production"
  }
}
