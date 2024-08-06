module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  cluster_name    = "my-cluster"
  cluster_version = "1.29"
  cluster_endpoint_public_access  = true
  vpc_id                   = module.vpc.vpc_id
  subnet_ids               = module.vpc.private_subnets

  eks_managed_node_groups = {
    nodes = {
      # Starting on 1.30, AL2023 is the default AMI type for EKS managed node groups
      
      instance_types = var.instance_types
      min_size     = 1
      max_size     = 1
      desired_size = 1
    
     
    }

    tags = {
        Environment = "dev"
        Terraform = "true"
    }
  }

}

