provider "aws" {
  region = var.region
  default_tags {
    tags = merge(
      local.common_tags,
      { Region_Purpose = "Active" } # The purpose of tag is to define the primary region, to more easily allow this template to be replicated to other regions
    )
  }
}
