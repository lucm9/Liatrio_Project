data "aws_caller_identity" "current" {}
data "aws_region" "current" {}

module "docker" {
  source     = "./modules/ecr"
  region     = data.aws_region.current.id
  account_id = data.aws_caller_identity.current.id
}

module "vpc" {
  source = "./modules/vpc"
}

module "eks" {
  source          = "./modules/eks-cluster"
  cluster_name    = "test-cluster"
  region          = data.aws_region.current.id
  account_id      = data.aws_caller_identity.current.id
  vpc_id          = module.vpc.vpc_id
  subnet_ids      = [module.vpc.subnet1, module.vpc.subnet2, module.vpc.subnet3, module.vpc.subnet4]
  node_subnet_ids = [module.vpc.subnet1, module.vpc.subnet2]
}

module "helm_deploy_local" {
  source                 = "./modules/helm"
  deployment_name        = "sample-app"             ## Release name in the namespace
  deployment_environment = "default"                ## Kubernetes Namespace
  deployment_path        = "${path.cwd}/sample-app" ## Remote chart location
  enabled                = true                     ## Enable to deploy the chart
  template_custom_vars = {
    deployment_image = "${data.aws_caller_identity.current.id}.dkr.ecr.${data.aws_region.current.id}.amazonaws.com/sample-docker:latest"
  }
}