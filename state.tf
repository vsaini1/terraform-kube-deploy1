terraform {
  backend "local" {
    path = "../states/terraform-kube-deploy1.tfstate"
  }
}
