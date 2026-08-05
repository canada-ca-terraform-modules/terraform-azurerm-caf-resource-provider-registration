mock_provider "azurerm" {}

# Step 1: simulate the currently-deployed resource (pre-upgrade inputs, no new args)
run "baseline_apply" {
  command = apply

  variables {
    name     = "Microsoft.ContainerService"
    features = {}
  }

  assert {
    condition     = azurerm_resource_provider_registration.rpr.name == "Microsoft.ContainerService"
    error_message = "Baseline apply: unexpected resource name"
  }
}

# Step 2: plan the upgraded code against that state — same inputs, must be no-op
run "upgrade_plan_no_replacement" {
  command = plan

  variables {
    name     = "Microsoft.ContainerService"
    features = {}
  }

  assert {
    condition     = azurerm_resource_provider_registration.rpr.name == "Microsoft.ContainerService"
    error_message = "Resource name must be unchanged after upgrade"
  }
}

# Step 3: adding a feature after the fact must not force replacement of the resource itself
run "upgrade_plan_add_feature" {
  command = plan

  variables {
    name = "Microsoft.ContainerService"
    features = {
      "AKS-DataPlaneAutoApprove" = { registered = true }
    }
  }

  assert {
    condition     = azurerm_resource_provider_registration.rpr.name == "Microsoft.ContainerService"
    error_message = "Resource name must remain unchanged when adding a feature"
  }

  assert {
    condition     = length(azurerm_resource_provider_registration.rpr.feature) == 1
    error_message = "New feature must be added in-place"
  }
}
