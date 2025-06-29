terraform {
  required_version = ">= 1.4.6"
  required_providers {
    aws = {
      source  = "hashicorp/aws"
      version = "~> 5.0" # Adjust based on the latest version
    }
  }
}

provider "aws" {
  region = "us-east-1" # Target region
}