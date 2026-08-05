resource_provider_registration = {
  "Microsoft.ContainerService" = { # (Required) The namespace of the Resource Provider which should be registered.
    # The features block is Optional. It provide a list of feature blocks as defined below.
    features = {
      "AKS-DataPlaneAutoApprove" = { # Specifies the name of the feature to register.
        registered = true            # (Required) Should this feature be Registered or Unregistered?
      }
    }
  }
}
