terraform {
  backend "s3" {
    bucket         = "my-terraform-state-bucket-nwewnre"
    key            = "eks/terraform.state"
    region         = "us-east-1"
    dynamodb_table = "terraform-locks-retywu"
    encrypt        = true
  }
}
