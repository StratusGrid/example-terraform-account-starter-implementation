#If no override_name_suffix, then use the combination of prepend_name_suffix, env_name, and append_name_suffix values for suffix.
locals {
  name_suffix = coalesce(var.override_name_suffix, "${var.prepend_name_suffix}-${var.env_name}${var.append_name_suffix}")

  s3_terraform_state_key = "${var.name_prefix}-account${local.name_suffix}.tfstate"
}
