module "my-vpc" {
  source   = "../modules/vpc"
  vpc_cidr = "10.0.0.0/16"
  vpc_id   = module.my-vpc.vpc-id
  sub_cidr = ["10.0.1.0/24", "10.0.2.0/24"]
  count1   = "2"
}