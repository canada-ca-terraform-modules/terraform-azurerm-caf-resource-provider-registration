# tflint-ignore: terraform_unused_declarations
variable "pr_number" {
  description = <<-EOT
    PR number suffix for resource isolation. This module operates at
    subscription scope (no resource group), so there is no naming collision
    risk between concurrent PRs - but the variable is still declared to
    satisfy the CI workflow contract that always passes TF_VAR_pr_number.
  EOT
  type        = string
  default     = "manual"
}

variable "name" {
  description = "The namespace of the Resource Provider to register (e.g. Microsoft.HanaOnAzure)"
  type        = string
}

variable "features" {
  description = "Optional feature blocks for the resource provider registration"
  type        = any
  default     = {}
}
