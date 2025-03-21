locals {
  aws_k8s_role_mapping = [{
    rolearn  = aws_iam_role.external-admin.arn
    username = "admin"
    groups   = ["none"]
    },
    {
      rolearn  = aws_iam_role.external-developer.arn
      username = "developer"
      groups   = ["none"]
    }
  ]
}