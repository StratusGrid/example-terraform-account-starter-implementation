# resource "aws_iam_role" "test_role" {
#   name = "test_role"
#   path = "/IacGhcPipelineResourceManagerRoles/"

#   assume_role_policy = data.aws_iam_policy_document.instance_assume_role_policy.json

# }

# data "aws_iam_policy_document" "instance_assume_role_policy" {
#   statement {
#     actions = ["sts:AssumeRole"]

#     principals {
#       type        = "Service"
#       identifiers = ["ec2.amazonaws.com"]
#     }
#   }
# }