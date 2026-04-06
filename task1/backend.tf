terraform {
  backend "gcs" {
    bucket = "terraform-state-lab3-devops2"
    prefix = "terraform/state"
  }
}
