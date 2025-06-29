module "vpc" {
  source  = "terraform-aws-modules/vpc/aws"
  version = "3.19.0"

  name = "eks-vpc"
  cidr = "10.0.0.0/16"
  azs  = ["us-east-1a", "us-east-1b", "us-east-1c"]
  public_subnets  = ["10.0.1.0/24", "10.0.2.0/24", "10.0.3.0/24"]
  private_subnets = ["10.0.4.0/24", "10.0.5.0/24", "10.0.6.0/24"]

  enable_nat_gateway = true
  tags = {
    "Name" = "eks-vpc"
  }
}

module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~>19.0"

  cluster_name    = "my-eks-cluster"
  cluster_version = "1.22"

  # Subnets
  vpc_id                 = module.vpc.vpc_id
  subnet_ids = module.vpc.subnets # Use this argument for private subnets
  
  enable_irsa            = true   # Enable IAM Roles for Service Accounts (optional)

  # Managed Node Groups
  eks_managed_node_groups = {
    eks_nodes = {
      desired_capacity = 2
      max_capacity     = 3
      min_capacity     = 1
      instance_type    = "t3.medium"
      key_name         = "my-key-pair"  # EC2 key pair for SSH access
    }
  }

  tags = {
    "Name" = "eks-cluster"
  }
}
