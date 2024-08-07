output "cluster_id" {
  value = aws_eks_cluster.your_eks_cluster_resource.id
}

output "cluster_name" {
  value = aws_eks_cluster.your_eks_cluster_resource.name
}
