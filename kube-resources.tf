resource "kubernetes_namespace" "online-boutique" {
  metadata {
    name = "online-boutique"
  }
}

resource "kubernetes_role" "namespace-viewer" {
  metadata {
    name = "namespace-viewer"
    namespace = "online-boutique"
  }

  rule {
    api_groups     = [""]
    resources      = ["pods", "services", "secrets", "configmap", "persistentvolumes"]
    verbs          = ["get", "list", "watch", "describe"]
  }

  rule {
    api_groups = ["apps"]
    resources  = ["deployments", "daemonsets", "statefulsets"]
    verbs      = ["get", "list", "watch", "describe"]
  }
}

resource "kubernetes_role_binding" "namespace-viewer" {
  metadata {
    name      = "namespace-viewer"
    namespace = "online-boutique"
  }
  role_ref {
    api_group = "rbac.authorization.k8s.io"
    kind      = "Role"
    name      = kubernetes_role.namespace-viewer.metadata[0].name
  }
  subject {
    kind      = "User"
    name      = "developer"
    api_group = "rbac.authorization.k8s.io"
  }
}

resource "kubernetes_cluster_role" "cluster_viewer" {
  metadata {
    name = "cluster-viewer"
  }

  rule {
    api_groups = [""]
    resources  = ["*"]
    verbs      = ["get", "list", "watch", "describe"]
  }
}

resource "kubernetes_cluster_role_binding" "cluster_viewer" {
  metadata {
    name = "cluster-viewer"
  }

  role_ref {
    kind     = "ClusterRole"
    name     = kubernetes_cluster_role.cluster_viewer.metadata[0].name
    api_group = "rbac.authorization.k8s.io"
  }

  subject {
    kind      = "User"
    name      = "admin"
    api_group = "rbac.authorization.k8s.io"
  }
}
