mock_provider "azurerm" {}

run "naming_convention" {
  command = plan

  variables {
    name     = "Microsoft.ContainerService"
    features = {}
  }

  assert {
    condition     = azurerm_resource_provider_registration.rpr.name == "Microsoft.ContainerService"
    error_message = "Resource provider registration name must match the supplied namespace"
  }
}

run "default_values" {
  command = plan

  variables {
    name = "Microsoft.PolicyInsights"
  }

  assert {
    condition     = azurerm_resource_provider_registration.rpr.name == "Microsoft.PolicyInsights"
    error_message = "Plan must succeed with only the required 'name' argument"
  }
}

run "single_feature" {
  command = plan

  variables {
    name = "Microsoft.ContainerService"
    features = {
      "AKS-DataPlaneAutoApprove" = { registered = true }
    }
  }

  assert {
    condition     = length(azurerm_resource_provider_registration.rpr.feature) == 1
    error_message = "One feature block must be rendered when a single feature is supplied"
  }

  assert {
    condition     = tolist(azurerm_resource_provider_registration.rpr.feature)[0].name == "AKS-DataPlaneAutoApprove"
    error_message = "Feature name must come from the feature map key"
  }

  assert {
    condition     = tolist(azurerm_resource_provider_registration.rpr.feature)[0].registered == true
    error_message = "Feature registered value must be passed through"
  }
}

run "multiple_features" {
  command = plan

  variables {
    name = "Microsoft.ContainerService"
    features = {
      "AKS-DataPlaneAutoApprove" = { registered = true }
      "AKS-SomeOtherFeature"     = { registered = false }
    }
  }

  assert {
    condition     = length(azurerm_resource_provider_registration.rpr.feature) == 2
    error_message = "Two feature blocks must be rendered when two features are supplied"
  }
}

run "no_features" {
  command = plan

  variables {
    name     = "Microsoft.PolicyInsights"
    features = {}
  }

  assert {
    condition     = length(azurerm_resource_provider_registration.rpr.feature) == 0
    error_message = "No feature blocks must be rendered when features is empty"
  }
}
