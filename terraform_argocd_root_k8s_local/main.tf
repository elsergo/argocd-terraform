provider "kubernetes" {
  config_path    = "~/.kube/config"
  config_context = "kubernetes-admin@kubernetes"
}


resource "kubernetes_manifest" "argocd_root" {
  manifest = yamldecode(templatefile("${path.module}/root.yaml", {
    path           = var.git_source_path
    repoURL        = var.git_source_repoURL
    targetRevision = var.git_source_targetRevision
  }))
}
