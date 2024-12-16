resource "aws_s3_bucket" "terraform_state" {
  bucket = "my-terraform-state-bucket" 

  lifecycle {
    prevent_destroy = true
  }

  tags = {
    Name = "Terraform-State-Bucket"
  }
}

resource "aws_s3_bucket_versioning" "versioning" {
  bucket = aws_s3_bucket.terraform_state.id
  versioning_configuration {
    status = "Enabled"
  }
}

output "s3-bucket" {
  value = aws_s3_bucket.terraform_state.bucket
}