resource "kubernetes_service" "devsu_demo" {
  metadata {
    name      = "devsu-demo-svc"
    namespace = kubernetes_namespace.devsu_demo.metadata[0].name

    labels = {
      "app.kubernetes.io/name"       = "devsu-demo-nodejs"
      "app.kubernetes.io/managed-by" = "terraform"
    }
  }

  spec {
    type = "ClusterIP"

    selector = {
      app = "devsu-demo-nodejs"
    }

    port {
      name        = "http"
      port        = var.port
      target_port = var.port
      protocol    = "TCP"
    }
  }
}
