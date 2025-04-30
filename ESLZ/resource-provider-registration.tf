variable "resource_provider_registration" {
  description = "Details about esource_provider_registration config"
  type        = any
  default     = {}
}

module "resource_provider_registration" {
  for_each = var.resource_provider_registration
  source   = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-resource-provider-registration?ref=v1.0.0"

  name     = each.key
  features = try(each.value.features, [])
}
