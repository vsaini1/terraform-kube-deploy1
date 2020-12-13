
resource "kubernetes_deployment" "example" {
  metadata {
    name = "terraform-example"
    #name = var.a.name
    labels = {
      test = "MyExampleApp"
      #test = var.a.selector
    }
  }

  spec {
    replicas = 1
    #replicas = var.a.replicas
    
    selector {
      match_labels = {
        test = "MyExampleApp"
        #test = var.a.selector
      }
    }

    template {
      metadata {
        labels = {
          test = "MyExampleApp"
          #test = var.a.selector
        }
      }

      spec {
        container {
          image = "nginx:1.7.8"
          name  = "example"
          #image = var.a.image
          #name  = var.a.cname

          resources {
            limits {
              #cpu    = "0.5"
              #memory = "512Mi"
              cpu    = "250m"
              memory = "50Mi"
              #cpu    = var.a.lcpu
              #memory = var.a.lmemory
            }
            requests {
              #cpu    = "250m"
              #memory = "50Mi"
              cpu    = "250m"
              memory = "50Mi"
              #cpu    = var.a.rcpu
              #memory = var.a.rmemory
            }
          }

          liveness_probe {
            http_get {
              path = "/nginx_status"
              port = 80

              http_header {
                name  = "X-Custom-Header"
                value = "Awesome1"
              }
            }

            initial_delay_seconds = 600
            period_seconds        = 600
          }
        }
      }
    }
  }
}
