resource "aws_iam_role" "this" {
  for_each = var.roles

  name = each.value.name

  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = sort(tolist(each.value.assume_role_services))
      }
      Action = "sts:AssumeRole"
    }]
  })

  tags = each.value.tags
}

resource "aws_iam_role_policy_attachment" "this" {
  for_each = {
    for attachment in flatten([
      for role_key, role in var.roles : [
        for policy_arn in role.managed_policy_arns : {
          key        = "${role_key}:${policy_arn}"
          role       = role_key
          policy_arn = policy_arn
        }
      ]
    ]) : attachment.key => attachment
  }

  role       = aws_iam_role.this[each.value.role].name
  policy_arn = each.value.policy_arn
}
