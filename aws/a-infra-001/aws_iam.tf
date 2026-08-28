module "iam_roles" {
  source = "./modules/iam_roles"

  roles = var.iam_roles
}

#### ----------- ECS EXPRESS ROLE POLICIES --------------

# module "iam_role_policy_ecs_express_infrastructure_logs" {
#   source = "./modules/iam_role_policy"

#   name = "ecs-express-infrastructure-logs"
#   role = module.iam_roles.role_names["ecs_express_infrastructure"]

#   policy = {
#     Version = "2012-10-17"
#     Statement = [
#       {
#         Effect = "Allow"
#         Action = [
#           "logs:CreateLogGroup",
#           "logs:CreateLogStream",
#           "logs:DescribeLogGroups",
#           "logs:PutLogEvents",
#         ]
#         Resource = "*"
#       },
#       {
#         Effect = "Allow"
#         Action = [
#           "ec2:AuthorizeSecurityGroupEgress",
#           "ec2:AuthorizeSecurityGroupIngress",
#           "ec2:CreateTags",
#           "ec2:CreateSecurityGroup",
#           "ec2:DescribeAccountAttributes",
#           "ec2:DescribeAvailabilityZones",
#           "ec2:DescribeNetworkInterfaces",
#           "ec2:DescribeRouteTables",
#           "ec2:DescribeSecurityGroups",
#           "ec2:DescribeSubnets",
#           "ec2:DescribeVpcs",
#           "ec2:RevokeSecurityGroupEgress",
#         ]
#         Resource = "*"
#       },
#       {
#         Effect = "Allow"
#         Action = [
#           "elasticloadbalancing:AddTags",
#           "elasticloadbalancing:CreateLoadBalancer",
#           "elasticloadbalancing:DescribeLoadBalancers",
#         ]
#         Resource = "*"
#       },
#       {
#         Effect = "Allow"
#         Action = [
#           "acm:AddTagsToCertificate",
#           "acm:RequestCertificate",
#         ]
#         Resource = "*"
#       },
#       {
#         Effect   = "Allow"
#         Action   = "iam:CreateServiceLinkedRole"
#         Resource = "arn:aws:iam::*:role/aws-service-role/elasticloadbalancing.amazonaws.com/AWSServiceRoleForElasticLoadBalancing"
#         Condition = {
#           StringLike = {
#             "iam:AWSServiceName" = "elasticloadbalancing.amazonaws.com"
#           }
#         }
#       },
#     ]
#   }
# }