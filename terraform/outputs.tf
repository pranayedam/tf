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
