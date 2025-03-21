# EKS Cluster
module "eks" {
  source  = "terraform-aws-modules/eks/aws"
  version = "~> 19.16"

  cluster_name                   = var.name
  cluster_version                = var.k8s_version
  cluster_endpoint_public_access = true

  vpc_id     = module.vpc.vpc_id
  subnet_ids = module.vpc.private_subnets

  create_cluster_security_group = false
  create_node_security_group    = false

  manage_aws_auth_configmap = true
  aws_auth_roles            = local.aws_k8s_role_mapping

  cluster_addons = {
    kube-proxy = {}
    vpc-cni    = {}
    coredns    = {}
  }

  eks_managed_node_groups = {
    initial = {
      instance_types = ["t3.micro"]
      min_size       = 1
      max_size       = 10
      desired_size   = 2
    }
  }

  tags = var.tags
}
