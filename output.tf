output "instance_name" {
  value = kubernetes_deployment.example.spec[0].template[0].spec[0].container[0].name
}
output "http_name" {
  value = kubernetes_deployment.example.spec[0].template[0].spec[0].container[0].liveness_probe[0].http_get[0].http_header[0].value
}
output "res_id" {
  value = kubernetes_deployment.example.id
}
