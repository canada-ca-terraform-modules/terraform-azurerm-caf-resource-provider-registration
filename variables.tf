variable "name" {
  description = "(Required) The namespace of the Resource Provider which should be registered. Changing this forces a new resource to be created."
  type        = string
}

variable "features" {
  description = "(Optional) A list of feature blocks parameters."
  type        = any
  default     = {}
}
