locals {
  required_values = {
    ## The release name will be 
    deployment_name = lower(var.deployment_name)
  }

  # When all requred values all deffined then also will incloude users values
  template_all_values = merge(local.required_values, var.template_custom_vars)
  timeout             = var.timeout
  recreate_pods       = var.recreate_pods
  trigger             = var.trigger == "UUID" ? uuid() : var.trigger
}

## The local chart deployment
resource "helm_release" "helm_local_deployment" {
  count         = var.enabled == true && var.remote_chart == false ? 1 : 0
  name          = var.deployment_name
  namespace     = var.deployment_environment
  chart         = var.deployment_path
  timeout       = local.timeout
  recreate_pods = local.recreate_pods
  version       = var.release_version

  values = [
    trimspace(templatefile("${var.deployment_path}/${var.values}", local.template_all_values))
  ]
}