variable "docker_image_tag" {
  type        = string
  description = "This is the tag which will be used for the image that you created"
  default     = "latest"
}

variable "region" {
  type        = string
  description = "This is the region where this code is deployed"

}

variable "account_id" {
  type        = string
  description = "This is the 12 digit aws account id"

}