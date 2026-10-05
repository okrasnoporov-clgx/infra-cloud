variable "roles" {
  description = "IAM roles and their trust policies and managed policies"
  type = map(object({
    name                 = string
    assume_role_services = set(string)
    managed_policy_arns  = set(string)
    tags                 = map(string)
  }))
}
