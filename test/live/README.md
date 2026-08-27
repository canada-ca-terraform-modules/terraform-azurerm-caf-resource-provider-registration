# `test/live/` - live-test harness

A live, real-Azure-resource harness used by the `live-test` PR check (see
the [`live-test-actions`](https://github.com/canada-ca-terraform-modules/live-test-actions)
repo and this module's own `.github/workflows/live-test.yml` once it lands)
to prove that an open PR doesn't destroy or replace a resource a real
consumer already has running.

## Module-specific notes

This module operates entirely at **subscription scope** — it registers Azure
Resource Providers via `azurerm_resource_provider_registration`. There are no
resource-group-level resources, so:

- No throwaway resource group is created in `test_dependencies.tf`.
- The `pr_number` variable exists only to satisfy the CI workflow contract
  (`TF_VAR_pr_number`); it has no effect on resource naming since provider
  registrations are subscription-global singletons.
- The fixture uses `Microsoft.HanaOnAzure` — an obscure, unused namespace in
  the sandbox subscription — so apply/destroy cannot affect anything else.

## What's here

| File | Purpose |
|---|---|
| `main.tf` | Module block with `source = "../../"`, the `azurerm` provider config, and an empty `backend "local" {}` block (path supplied at `init` time). |
| `test_dependencies.tf` | Empty — no dependency resources needed for subscription-scope modules. |
| `variables.tf` | `env`, `pr_number` (CI contract), `name`, and `features` (module inputs). |
| `config/resource_provider_registration.tfvars` | Minimal fixture: registers `Microsoft.HanaOnAzure` with no features. |

## Running it manually

Requires your own `az login` session against the sandbox subscription (CI
uses OIDC instead).

```bash
cd test/live
terraform init
terraform plan  -var-file=config/resource_provider_registration.tfvars
terraform apply -var-file=config/resource_provider_registration.tfvars
```

Confirm only the resource provider registration is planned/applied, then
tear it down:

```bash
terraform destroy -var-file=config/resource_provider_registration.tfvars
```

No `.tfstate` file is ever committed under `test/live/` — every run is
fully ephemeral, whether run by CI or by hand.
