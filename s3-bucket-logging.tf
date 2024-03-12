################################################################################
# Amazon S3 Bucket for centralized log storage. 
################################################################################

#trivy:ignore:AVD-AWS-0088
#trivy:ignore:AVD-AWS-0089
module "s3_bucket_logging" {
  source      = "StratusGrid/s3-bucket-logging/aws"
  version     = "2.1.4"
  name_prefix = var.name_prefix
  name_suffix = "${local.name_suffix}-${var.region}"
  input_tags  = merge(local.common_tags, {})
}