# AzureRM Resource Provider Registration

Registers an Azure Resource Provider (and optionally its preview features) using
`azurerm_resource_provider_registration`. Compatible with `azurerm ~> 5.0`.

## Usage

### ESLZ module block (`ESLZ/resource-provider-registration.tf`)

```hcl
module "resource_provider_registration" {
  for_each = var.resource_provider_registration
  source   = "github.com/canada-ca-terraform-modules/terraform-azurerm-caf-resource-provider-registration?ref=v1.1.0"

  name     = each.key
  features = try(each.value.features, {})
}
```

## Terraform variables for this module

[./ESLZ/resource-provider-registration.tfvars](./ESLZ/resource-provider-registration.tfvars)

## Testing

```bash
terraform fmt -recursive && terraform init -backend=false && terraform validate && terraform test
```

<!-- BEGIN_TF_DOCS -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.9 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 5.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | ~> 5.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [azurerm_resource_provider_registration.rpr](https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/resource_provider_registration) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_features"></a> [features](#input\_features) | (Optional) A list of feature blocks parameters. | `any` | `{}` | no |
| <a name="input_name"></a> [name](#input\_name) | (Required) The namespace of the Resource Provider which should be registered. Changing this forces a new resource to be created. | `string` | n/a | yes |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_resource_provider_registration"></a> [resource\_provider\_registration](#output\_resource\_provider\_registration) | Resource Provider Registration object |
<!-- END_TF_DOCS -->
