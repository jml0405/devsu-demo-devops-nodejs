output "namespace" {
  description = "Kubernetes namespace where the app is deployed"
  value       = kubernetes_namespace.devsu_demo.metadata[0].name
}

output "deployment_name" {
  description = "Name of the Kubernetes Deployment"
  value       = kubernetes_deployment.devsu_demo.metadata[0].name
}

output "service_name" {
  description = "Name of the Kubernetes Service"
  value       = kubernetes_service.devsu_demo.metadata[0].name
}

output "service_port" {
  description = "Port exposed by the Service"
  value       = var.port
}

output "ingress_host" {
  description = "Hostname configured on the Ingress"
  value       = kubernetes_ingress_v1.devsu_demo.spec[0].rule[0].host
}

output "image_deployed" {
  description = "Full image reference that was deployed"
  value       = "${var.image_name}:${var.image_tag}"
}
