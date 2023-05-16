terraform {
  required_providers {
    docker = {
      source  = "kreuzwerker/docker"
      version = "3.0.2"
    }
  }
}

provider "docker" {
  host = "unix:///var/run/docker.sock"
}


resource "terraform_data" "command" {
  provisioner "local-exec" {
    command = "npm install express && npm fund"
  }
}

# Docker image build
resource "docker_image" "my_image" {
  name = "my_image"
  build {
    context = path.cwd
    label = {
      author : "zoo"
    }
  }
  depends_on = [terraform_data.command]
}


resource "aws_ecr_repository" "foo" {
  name                 = "sample-docker"
  image_tag_mutability = "MUTABLE"
  lifecycle {
    ignore_changes = all
  }
}


resource "terraform_data" "push_command" {
  provisioner "local-exec" {
    command = "aws ecr get-login-password --region ${var.region} | docker login --username AWS --password-stdin ${var.account_id}.dkr.ecr.${var.region}.amazonaws.com && docker tag my_image:latest ${var.account_id}.dkr.ecr.${var.region}.amazonaws.com/sample-docker:latest && docker push ${var.account_id}.dkr.ecr.${var.region}.amazonaws.com/sample-docker:latest"
  }
  depends_on = [aws_ecr_repository.foo, docker_image.my_image]

}

output "docker_repo" {
  value = aws_ecr_repository.foo.id
}