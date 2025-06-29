output "eks_cluster_id" {
  description = "ID of the EKS Cluster"
  value       = module.eks.cluster_id
}

output "eks_cluster_endpoint" {
  description = "EKS Cluster Endpoint URL"
  value       = module.eks.cluster_endpoint
}

output "eks_kubeconfig" {
  description = "A kubectl configuration to access the EKS cluster"
  value       = module.eks.kubeconfig
}