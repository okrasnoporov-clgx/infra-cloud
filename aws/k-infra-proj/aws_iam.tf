module "iam_roles" {
  source = "./modules/iam_roles"

  roles = var.iam_roles
}