module "my-stage-vpc" {
  source   = "../modules/vpc"
  vpc_cidr = "15.0.0.0/16"
  vpc_id   = module.my-vpc.vpc-id
  sub_cidr = ["15.0.1.0/24", "15.0.2.0/24"]
  count1   = "2"
}
