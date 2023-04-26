terraform {
  required_providers {
    ametnes = {
      source  = "ametnes/ametnes"
      version = "0.3.2"
    }
  }
}

// Define our provider
provider "ametnes" {
  host     = var.url
  token    = var.token
  username = var.username
  insecure = var.insecure
}

// Define our project
data "ametnes_project" "project" {
  name = var.project
}

// Our resource URLs and ports assigned
output "connections" {
  value = {
    harperdb = concat(
      ametnes_service.harperdb_aws.connections,
      ametnes_service.harperdb_gcp.connections
    )
  }
}
