# dynamodb-s3-backend.tf

provider "aws" {
  region = "us-east-1"
}

# S3 Bucket for Terraform State
resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-terraform-state-bucket-nwewnre" # Make sure this is unique globally
  region = "us-east-1"
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
  name         = "terraform-locks-retywu"
  billing_mode = "PAY_PER_REQUEST"

  hash_key = "LockID"  # Primary Key

  attribute {
    name = "LockID"    # Partition Key Attribute
    type = "S"
  }

  attribute {
    name = "SessionID" # Global Secondary Index Attribute
    type = "S"
  }

  global_secondary_index {
    name            = "SessionIndex"
    hash_key        = "SessionID" # Partition key for the secondary index
    projection_type = "ALL"       # Include all attributes in the index
  }

  tags = {
    Name        = "Terraform-Locks"
    Environment = "Production"
  }
}
