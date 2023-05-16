# helm

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

No requirements.

## Providers

| Name | Version |
|------|---------|
| <a name="provider_helm"></a> [helm](#provider\_helm) | n/a |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [helm_release.helm_local_deployment](https://registry.terraform.io/providers/hashicorp/helm/latest/docs/resources/release) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_chart_repo"></a> [chart\_repo](#input\_chart\_repo) | -(Optional) Provide the remote helm charts repository. | `string` | `""` | no |
| <a name="input_deployment_environment"></a> [deployment\_environment](#input\_deployment\_environment) | -(Required) The name of the environment | `any` | n/a | yes |
| <a name="input_deployment_name"></a> [deployment\_name](#input\_deployment\_name) | -(Required) The name of the deployment | `any` | n/a | yes |
| <a name="input_deployment_path"></a> [deployment\_path](#input\_deployment\_path) | -(Required) Chart location or chart name <stable/example> | `any` | n/a | yes |
| <a name="input_enabled"></a> [enabled](#input\_enabled) | -(Optional) deployment can be disabled or enabled by using this bool! | `bool` | `true` | no |
| <a name="input_recreate_pods"></a> [recreate\_pods](#input\_recreate\_pods) | n/a | `bool` | `false` | no |
| <a name="input_release_version"></a> [release\_version](#input\_release\_version) | -(Optional) Specify the exact chart version to install | `string` | `"0.1.0"` | no |
| <a name="input_remote_chart"></a> [remote\_chart](#input\_remote\_chart) | -(Optional) For the remote charts set to <true> | `bool` | `false` | no |
| <a name="input_remote_override_values"></a> [remote\_override\_values](#input\_remote\_override\_values) | -(Optional) | `string` | `""` | no |
| <a name="input_template_custom_vars"></a> [template\_custom\_vars](#input\_template\_custom\_vars) | -(Optional) Local chart replace variables from values.yaml | `map(any)` | `{}` | no |
| <a name="input_timeout"></a> [timeout](#input\_timeout) | n/a | `string` | `"400"` | no |
| <a name="input_trigger"></a> [trigger](#input\_trigger) | n/a | `string` | `"UUID"` | no |
| <a name="input_values"></a> [values](#input\_values) | -(Optional) Local chart <values.yaml> location | `string` | `"values.yaml"` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_success_output"></a> [success\_output](#output\_success\_output) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
