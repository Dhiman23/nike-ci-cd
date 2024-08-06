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

}