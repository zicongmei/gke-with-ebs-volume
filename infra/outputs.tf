
output "aws-region" {
  description = "AWS region"
  value       = var.aws-region
}

output "cluster_name" {
  description = "Kubernetes Cluster Name"
  value       = local.cluster_name
}


output "eks-kubeconfig" {
  value = "aws eks update-kubeconfig --region ${var.aws-region} --name ${local.cluster_name}"
}

output "gke-kubeconfig" {
  value = "gcloud container clusters get-credentials ${local.cluster_name} --region ${var.gcp-region} --project ${var.gcp_project_id}"
}

output "gcp_project_id" {
  value = var.gcp_project_id
}

output "eks_oidc_issuer_url" {
  value = module.eks.cluster_oidc_issuer_url
}

