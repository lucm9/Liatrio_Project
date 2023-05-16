variable "vpc_id" {
  type        = string
  description = "This is the VPC ID where the cluster will be created"

}

variable "subnet_ids" {
  type        = list(any)
  description = "This is the public & private subnetids for the VPC"
}

variable "node_subnet_ids" {
  type        = list(any)
  description = "This is the private subnetids for the VPC"

}


variable "cluster_name" {
  type        = string
  description = "This is the desired name of the cluster"

}



variable "region" {
  type        = string
  description = "This is the region where this code is deployed"

}

variable "account_id" {
  type        = string
  description = "This is the 12 digit aws account id"

}