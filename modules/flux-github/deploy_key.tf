data "github_repository" "flux" {
  name = var.github_repository_name
}

resource "github_repository_deploy_key" "flux" {
  title      = "${var.deploy_key_name} (Flux)"
  repository = data.github_repository.flux.name
  read_only  = false
  key        = var.public_key_openssh
}
