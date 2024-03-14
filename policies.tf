# resource "aws_iam_policy" "manage_roles" {
#   name        = "ManageRoles"
#   path        = "/IacGhcPipelineResourceManagerPolicy/"
#   description = "Policy that allows the creation of roles"

#   policy = data.aws_iam_policy_document.manage_roles.json
# }

# data "aws_iam_policy_document" "manage_roles" {
#   statement {
#     actions = [
#       "iam:CreateRole",
#       "iam:AttachRolePolicy",
#       "iam:PutRolePolicy",
#       "iam:TagRole",
#       "iam:DeleteRole",
#       "iam:GetRole",
#       "iam:ListRolePolicies",
#       "iam:ListAttachedRolePolicies",
#       "iam:ListInstanceProfilesForRole",
#       "iam:DeleteRole"
#     ]
#     resources = [
#       "arn:aws:iam::327110749334:role/IacGhcPipelineResourceManagerRoles/test_role"
#     ]
#   }
# }

# resource "aws_iam_role_policy_attachment" "manage_roles" {
#   role       = data.aws_iam_role.iac_ghc_pipeline_resource_manager_role.name
#   policy_arn = aws_iam_policy.manage_roles.arn
# }

