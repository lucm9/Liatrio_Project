output "aggregate" {
  value = [module.eks.*, module.helm_deploy_local.*]
}