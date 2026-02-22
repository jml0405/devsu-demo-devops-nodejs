resource "kubernetes_namespace" "devsu_demo" {
  metadata {
    name = var.namespace

    labels = {
      "app.kubernetes.io/managed-by" = "terraform"
      "app.kubernetes.io/part-of"    = "devsu-demo"
    }
  }
}
