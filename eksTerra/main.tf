#VPC

provider "aws" {
  region = "us-east-1"
}

module "vpc" {
  source = "terraform-aws-modules/vpc/aws"

  name = "eks-cluster"
  cidr = var.vpc_cidr

  azs             = data.aws_availability_zones.azs.names
  private_subnets = var.private_subnets
  public_subnets  = var.public_subnets

  enable_nat_gateway = true
  enable_vpn_gateway = true
  single_nat_gateway = true

  tags = {
    "kubernetes.io/cluster/eks-cluster" = "shared"

  }
  public_subnet_tags = {
    "kubenetes.io/cluster/eks-cluster" = "shared"
    "kubenetes.io/role/elb"            = 1
  } 
  private_subnet_tags = {
    "kubenetes.io/cluster/eks-cluster" = "shared"
    "kubenetes.io/role/elb"            = 1
  }

}

#EKS
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  cluster_name    = "eks-cluster"
  cluster_version = "1.29"
  cluster_endpoint_public_access  = true
  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
  enable_irsa = true

  eks_managed_node_groups = {
    nodes = {
      
      instance_types = var.instance_types

      min_size     = 1
      max_size     = 1
      desired_size = 1
    }
  }

  tags={
    Environment = "dev"
    Terraform = "true"
  }


}

