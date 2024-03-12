
#trivy:ignore:AVD-AWS-0088
#trivy:ignore:AVD-AWS-0132
module "terraform_state" {
  source        = "StratusGrid/terraform-state-s3-bucket-centralized-with-roles/aws"
  version       = "5.1.1"
  name_prefix   = var.name_prefix
  name_suffix   = local.name_suffix
  log_bucket_id = module.s3_bucket_logging.bucket_id
}