# terraform-helm-flux

Bootstrapper for Flux on a a Kubernetes cluster supporting Github and Gitlab.

### Github example 

```
module "flux" {
     source                          = "emmekappa/flux/helm"
     version                         = "0.0.1"
     flux_path                       = "k8s/"
     git_branch                      = "master"
     git_http_url                    = module.flux-github.git-http-url
     git_ssh_url                     = module.flux-github.git-ssh-url
     private_key_pem                 = module.flux-bootstrap.private_key_pem
     flux_garbage_collection_enabled = true
     depends_on                      = [google_container_node_pool.default]
   }
   
   module "flux-github" {
     source                 = "emmekappa/flux/helm//modules/flux-github"
     version                = "0.0.1"
     deploy_key_name        = "flux-deploy-key"
     github_org_name        = "your-github-org"
     github_repository_name = "your-sample-repo"
     public_key_openssh     = module.flux.public_key_openssh
   }
```
