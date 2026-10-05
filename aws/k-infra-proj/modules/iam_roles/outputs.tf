output "role_arns" {
  description = "ARNs of the created IAM roles"
  value       = { for role_key, role in aws_iam_role.this : role_key => role.arn }
}

output "role_names" {
  description = "Names of the created IAM roles"
  value       = { for role_key, role in aws_iam_role.this : role_key => role.name }
}
