resource "azurerm_resource_provider_registration" "rpr" {
  name = var.name

  dynamic "feature" {
    for_each = var.features
    content {
      name       = feature.key
      registered = feature.value.registered
    }
  }
}
