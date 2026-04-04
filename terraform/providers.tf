provider "google" {
  project = var.project_id
  region = var.region
  zone = var.zone
  credentials = file("/home/kolinssviatoslav/yablonskyi-lab3/terraformkey.json")
}

