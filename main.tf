terraform {
  required_version = ">= 0.13.1"

  required_providers {
    shoreline = {
      source  = "shorelinesoftware/shoreline"
      version = ">= 1.11.0"
    }
  }
}

provider "shoreline" {
  retries = 2
  debug = true
}

module "container_startup_delay_incident" {
  source    = "./modules/container_startup_delay_incident"

  providers = {
    shoreline = shoreline
  }
}