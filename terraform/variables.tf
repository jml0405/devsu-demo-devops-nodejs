variable "kubeconfig_path" {
  description = "Path to the kubeconfig file"
  type        = string
  default     = "~/.kube/config"
}

variable "kubeconfig_context" {
  description = "kubeconfig context to use (leave empty for current-context)"
  type        = string
  default     = ""
}

variable "namespace" {
  description = "Kubernetes namespace for the application"
  type        = string
  default     = "devsu-demo"
}

variable "image_name" {
  description = "Docker Hub image name (e.g. jml0405/devsu-demo-nodejs)"
  type        = string
  default     = "jml0405/devsu-demo-nodejs"
}

variable "image_tag" {
  description = "Docker image tag to deploy"
  type        = string
  default     = "latest"
}

variable "replicas" {
  description = "Number of desired pod replicas"
  type        = number
  default     = 2
}

variable "port" {
  description = "Application port"
  type        = number
  default     = 8000
}

variable "database_name" {
  description = "SQLite database file path (non-sensitive)"
  type        = string
  default     = "./dev.sqlite"
}

variable "database_user" {
  description = "SQLite database user (sensitive)"
  type        = string
  sensitive   = true
  default     = "user"
}

variable "database_password" {
  description = "SQLite database password (sensitive)"
  type        = string
  sensitive   = true
  default     = "password"
}
