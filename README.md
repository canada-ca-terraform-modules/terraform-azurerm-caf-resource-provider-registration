# AzureRM Resource Provider Registration

## Terraform variables for this module

[./ESLZ/resource-provider-registration.tfvars](./ESLZ/resource-provider-registration.tfvars)

<!-- BEGIN_TF_DOCS -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_azurerm"></a> [azurerm](#provider\_azurerm) | n/a |

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