# test_dependencies.tf
#
# This module operates entirely at subscription scope
# (azurerm_resource_provider_registration) - it creates no resource-group-
# level resources. No throwaway dependency resources are needed.
#
# The pr_number variable is still declared (in variables.tf) to satisfy the
# CI workflow's TF_VAR_pr_number contract, but it has no effect on resource
# naming here since provider registrations are subscription-global singletons.
