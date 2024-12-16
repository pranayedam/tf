terraform {
  backend "s3" {
    bucket  = "drona36"
    key     = "terraform.workspace"
    region  = "ap-southeast-2" # Replace with your desired region
    encrypt = true
  }
}