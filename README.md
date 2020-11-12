# terraform-helm-flux

Bootstrapper for [Flux v1](https://docs.fluxcd.io/en/1.21.0/) on a a Kubernetes cluster supporting Github and Gitlab.

## Introduction 

### Flux 

Continuous delivery is a term that encapsulates a set of best practices that surround building, deploying and monitoring applications. The goal is to provide a sustainable model for maintaining and improving an application.

Flux is a tool that automates the deployment of containers to Kubernetes. It fills the automation void that exists between building and monitoring.

[Read more...](https://docs.fluxcd.io/en/1.21.0/introduction/)

## SCM support
* [Github submodule](https://registry.terraform.io/modules/emmekappa/flux/helm/latest/submodules/flux-github)
* [Gitlab submodule](https://registry.terraform.io/modules/emmekappa/flux/helm/latest/submodules/flux-gitlab)

## Usage

### Github example

```
module "flux" {
     source                          = "emmekappa/flux/helm"
     flux_path                       = "k8s/"
     git_branch                      = "master"
     git_http_url                    = module.flux-github.git-http-url
     git_ssh_url                     = module.flux-github.git-ssh-url
     flux_garbage_collection_enabled = true
     depends_on                      = [google_container_node_pool.default]
}
   
module "flux-github" {
     source                 = "emmekappa/flux/helm//modules/flux-github"
     deploy_key_name        = "flux-deploy-key"
     github_org_name        = "your-github-org"
     github_repository_name = "your-sample-repo"
     public_key_openssh     = module.flux.public_key_openssh
}
```
