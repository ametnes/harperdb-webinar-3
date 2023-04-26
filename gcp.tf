// Define our location for GCP
data "ametnes_location" "gcp_location" {
  name = var.gcp_location.name
  code = var.gcp_location.code
}

// Define the network to use
resource "ametnes_network" "gcp_network" {
  name     = "NETWORK-USC1"
  project  = data.ametnes_project.project.id
  location = data.ametnes_location.gcp_location.id
}

// Define our service
resource "ametnes_service" "harperdb_gcp" {
  name        = "HarperDB-Demo-Instance-GCP"
  project     = data.ametnes_project.project.id
  location    = data.ametnes_location.gcp_location.id
  kind        = "harperdb:3.3"
  description = "HarperDB Demo Instance GCP"
  network     = ametnes_network.gcp_network.resource_id
  capacity {
    storage = 100
    memory  = 4
    cpu     = 2
  }

  config = {
    "admin.user"          = var.admin_user.name
    "admin.password"      = var.admin_user.password
    "clustering.user"     = var.cluster_user.name
    "clustering.password" = var.cluster_user.password
  }

  nodes = 1
}
