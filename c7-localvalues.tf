locals {
  rg_name   = "${var.resource_group_name}-${var.environment}-${var.business_unit}"
  vnet_name = "${var.business_unit}-${var.environment}-${var.resource_group_name}"

  service_name = "devops"
  owner        = "nagodownam"

  common_tags = {
    service = local.service_name
    owner   = local.owner
    Tag1    = "CommitAye"
    Tag2    = "Notification Test"
  }
}

