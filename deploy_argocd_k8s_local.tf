module "argocd_k8s_local" {
  source        = "./terraform_argocd_k8s_local"
  chart_version = "6.9.3"
}

module "argocd_app_root_k8s_local" {
  source             = "./terraform_argocd_root_k8s_local"
  git_source_path    = "k8s-local/applications"
  git_source_repoURL = "git@github.com:elsergo/argocd.git"
}
