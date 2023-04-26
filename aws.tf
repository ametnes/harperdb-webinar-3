// Define our location for AWS
data "ametnes_location" "aws_location" {
  name = var.aws_location.name
  code = var.aws_location.code
}

// Define the network to use
resource "ametnes_network" "aws_network" {
  name     = "NETWORK-USE1"
  project  = data.ametnes_project.project.id
  location = data.ametnes_location.aws_location.id
}

// Define our service
resource "ametnes_service" "harperdb_aws" {
  name        = "HarperDB-Demo-Instance-AWS"
  project     = data.ametnes_project.project.id
  location    = data.ametnes_location.aws_location.id
  kind        = "harperdb:3.3"
  description = "HarperDB Demo Instance AWS"
  network     = ametnes_network.aws_network.resource_id
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
