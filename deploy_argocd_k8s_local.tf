terraform {
  backend "s3" {
    bucket                      = "terraform"
    key                         = "argocd-terraform/terrafrom.tfstate"
    access_key                  = "GFWjzk9h1dmXmeXao7H3"
    secret_key                  = "jBRR8L3XPP6nizTanNjU8QP2RCd3qB8NwM4kBlc2"
    region                      = "main"
    skip_credentials_validation = true  # Skip AWS related checks and validations
    skip_requesting_account_id  = true
    skip_metadata_api_check     = true
    skip_region_validation      = true
    use_path_style              = true
    endpoints                   = {
      s3 = "https://minio.home.sergeysidorenko.com"
    }
  }
}

module "argocd_k8s_local" {
  source        = "./terraform_argocd_k8s_local"
  chart_version = "6.9.3"
}

module "argocd_app_root_k8s_local" {
  source             = "./terraform_argocd_root_k8s_local"
  git_source_path    = "k8s-local/applications"
  git_source_repoURL = "git@github.com:elsergo/argocd.git"
}
