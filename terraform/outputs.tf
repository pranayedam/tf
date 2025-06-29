output "eks_cluster_id" {
  description = "ID of the EKS Cluster"
  value       = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  description = "EKS Cluster Endpoint URL"
  value       = module.eks.cluster_endpoint
}

output "eks_cluster_certificate_authority" {
  description = "EKS Cluster certificate authority"
  value       = module.eks.cluster_certificate_authority_data
}

output "eks_kubeconfig" {
  description = "Kubeconfig file for the EKS cluster"
  value = templatefile("${path.module}/kubeconfig.tmpl", {
    endpoint                = module.eks.cluster_endpoint
    cluster_certificate     = module.eks.cluster_certificate_authority_data
    cluster_name            = module.eks.cluster_name
  })
}
