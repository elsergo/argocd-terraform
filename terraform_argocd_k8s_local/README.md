# Module to deploy Higly Availabe ArgoCD via HelmChart to local K8s cluster

Example to use:

```
module "argocd" {
  source           = "./terraform_argocd_k8s_local"
  chart_version    = "6.9.3"
}
```

Copyleft (c) by Sergey Sidorenko.