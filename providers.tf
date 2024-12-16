provider "aws" {
  region = "us-east-1" 
}

terraform {
  backend "s3" {
    bucket         = "drona36"
    key            = "path/tf"
    region         = "ap-southeast-2"  # Replace with your desired region
    encrypt        = true
  }
}