# config/resource_provider_registration.tfvars
# Tracked, ready-to-run fixture for the test/live harness.
#
# Registers a single, obscure Azure Resource Provider namespace
# (Microsoft.HanaOnAzure) - deliberately chosen because no other resource in
# the sandbox subscription depends on it, so apply/destroy cannot affect
# anything else.

name = "Microsoft.HanaOnAzure"
