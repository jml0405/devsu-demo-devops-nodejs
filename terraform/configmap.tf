resource "kubernetes_config_map" "devsu_demo" {
  metadata {
    name      = "devsu-demo-config"
    namespace = kubernetes_namespace.devsu_demo.metadata[0].name

    labels = {
      "app.kubernetes.io/name"       = "devsu-demo-nodejs"
      "app.kubernetes.io/managed-by" = "terraform"
    }
  }

  data = {
    PORT          = tostring(var.port)
    NODE_ENV      = "production"
    DATABASE_NAME = var.database_name
  }
}
