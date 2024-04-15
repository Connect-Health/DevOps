terraform {
  required_providers {
    neon = {
      source  = "terraform-community-providers/neon"
      version = "0.1.6"
    }
  }
}

provider "neon" {
  token = var.neon_token
}