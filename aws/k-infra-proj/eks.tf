module "eks" {
  source = "./modules/eks"

  cluster_name        = var.eks_cluster_name
  cluster_role_arn    = module.iam_roles.role_arns["eks_cluster"]
  node_role_arn       = module.iam_roles.role_arns["eks_node"]
  subnet_ids          = [module.vpc_subnet.id, module.vpc_subnet_2.id]
  node_instance_types = var.eks_node_instance_types
  node_disk_size      = var.eks_node_disk_size
  node_desired_size   = var.eks_node_desired_size
  node_min_size       = var.eks_node_min_size
  node_max_size       = var.eks_node_max_size
  tags                = var.eks_tags

  depends_on = [
    module.iam_roles,
    aws_route_table_association.eks_public,
  ]
}
