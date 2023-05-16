# lucs_project<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= 1.0 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | >= 4.47 |
| <a name="requirement_kubernetes"></a> [kubernetes](#requirement\_kubernetes) | >= 2.10 |
| <a name="requirement_time"></a> [time](#requirement\_time) | >= 0.9 |
| <a name="requirement_tls"></a> [tls](#requirement\_tls) | >= 3.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_aws"></a> [aws](#provider\_aws) | >= 4.47 |

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_docker"></a> [docker](#module\_docker) | ./modules/ecr | n/a |
| <a name="module_eks"></a> [eks](#module\_eks) | ./modules/eks-cluster | n/a |
| <a name="module_helm_deploy_local"></a> [helm\_deploy\_local](#module\_helm\_deploy\_local) | ./modules/helm | n/a |
| <a name="module_vpc"></a> [vpc](#module\_vpc) | ./modules/vpc | n/a |

## Resources

| Name | Type |
|------|------|
| [aws_caller_identity.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/caller_identity) | data source |
| [aws_region.current](https://registry.terraform.io/providers/hashicorp/aws/latest/docs/data-sources/region) | data source |

## Inputs

No inputs.

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_aggregate"></a> [aggregate](#output\_aggregate) | n/a |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Project Description 

This project is written in terraform and creates all necessary infrastructure (Amazon Eks, roles ,policies, docker image, ecr and helm release) to deploy a sample application on eks. The application is exposed with network load balancer and can be accessed by network load balancer dns. The output is as shown below:
```
{
“message”: “Automate all the things!”,
“timestamp”: 1529729125
}
```

### Prerequisites of system going to use this module: 
1. Terraform latest version installed. [Terraform](https://developer.hashicorp.com/terraform/tutorials/aws-get-started/install-cli)
2. Docker installed and accessible through command line. [Docker Installation](https://docs.docker.com/engine/install/)
3. Helm installed on the system. [Helm](https://helm.sh/docs/intro/install/ß)
4. Kubectl installed on the system. [Kubectl Installation](https://kubernetes.io/docs/tasks/tools/)
5. Gitbash installed [only for windows] [Gitbash](https://git-scm.com/download/win)
6. NodeJS & npm installed and configured to run through cli. [Nodejs & npm](https://docs.npmjs.com/downloading-and-installing-node-js-and-npm)
7. AWS CLI installed as the current module is also using it at multiple places. [AWSCLI](https://docs.aws.amazon.com/cli/latest/userguide/getting-started-install.html)

### Steps to trigger the creation of resources and deployment of application.

1. Setup AWS credentials by running below command on terminal. Set the ACCESS_KEY, SECRET_ACCESS_KEY and REGION parameter.
```
aws configure
```

2. Initialize the terraform. 
```
terraform init
```
3. View the plan by using below command.
```
terraform plan
```
4. Create the resources by running below command.
```
terraform apply -auto-approve
```
5. Once terraform is created successfully, run the below command to get NLB dns
```
kubectl get svc
```
6. Use that dns in browser and the webpage will open.

### Single command for resource creation and app deployment
```
terraform init && terraform plan && terraform apply -auto-approve
```

### Cleanup prerequisite.
1. Delete all the images in amazon ECR.

### Cleanup
1. Run below command and it should cleanup everything.
```
terraform destroy -auto-approve
```

