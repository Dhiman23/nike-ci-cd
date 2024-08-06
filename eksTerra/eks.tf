module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-cluster"
  cluster_version = "1.29"
  cluster_endpoint_public_access  = true
  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets
 

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

data "aws_eks_cluster" "cluster"{
    name = module.eks.cluster_id

}

data "aws_eks_cluster_auth" "cluster"{
    name = module.eks.cluster_id
    
}