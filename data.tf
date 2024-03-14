data "aws_caller_identity" "current" {}

data "aws_iam_role" "iac_ghc_pipeline_resource_manager_role" {
  name = "IacGhcPipelineResourceManagerRole"
}