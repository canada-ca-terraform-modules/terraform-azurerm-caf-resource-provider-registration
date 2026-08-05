# Changelog

All notable changes to this module are documented in this file.
The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.1.0/).

## v1.1.0 - 2026-08-05

### Changed

- Upgraded target provider to `azurerm ~> 5.0` (tested against `5.0.1`). No
  argument or schema changes were required — `azurerm_resource_provider_registration`
  (`name`, `feature { name, registered }`) is unchanged between the prior provider
  version and `5.0.1`.
- Formatted `module.tf` (`terraform fmt`).

### Added

- `providers.tf` pinning `azurerm ~> 5.0` and `required_version >= 1.9`.
- `.tflint.hcl` using `call_module_type = "local"`.
- `.gitignore` and `.gitattributes` (LF line endings enforced).
- `tests/resource_provider_registration.tftest.hcl` — naming, default values,
  single feature, multiple features, and no-features coverage.
- `tests/upgrade_compat.tftest.hcl` — state-chaining test proving the resource
  is not replaced across the upgrade and that adding a feature afterwards is
  an in-place change.
- `.github/workflows/terraform-ci.yml` — fmt/init/validate/test/tflint on every PR.
- `.github/workflows/release.yml` — creates a GitHub release on merge to `main`,
  tagged from `ESLZ/resource-provider-registration.tf`'s own `?ref=`.

### Known blockers

- None.
