terraform {
  required_version = ">= 1.3.0"

  required_providers {
    github = {
      source  = "integrations/github"
      version = "~> 6.0"
    }
  }
}

provider "github" {
  # Token lấy từ biến môi trường GITHUB_TOKEN
  # Owner lấy từ biến môi trường GITHUB_OWNER, hoặc set var.github_owner
  owner = var.github_owner != "" ? var.github_owner : null
}
