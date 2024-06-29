# EKS Cluster
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 20.15"

  cluster_name                   = var.name
  cluster_version                = var.k8s_version
  cluster_endpoint_public_access = true
  
  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  create_cluster_security_group = false
  create_node_security_group    = false
  
  cluster_addons = {
    kube-proxy = {}
    vpc-cni    = {}
    coredns = {}
  }
  
  eks_managed_node_groups = {
    initial = {
      instance_types = ["t3.micro"]
      min_size     = 2
      max_size     = 20
      desired_size = 4
    }
  }

  tags = var.tags
}