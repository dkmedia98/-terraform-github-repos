# Repo chứa chính bộ Terraform này (bootstrap)
# Apply riêng bằng -target để không chạm vào github_repository.this:
#   terraform apply -target='github_repository.self'

variable "self_repo_name" {
  description = "Tên repo chứa chính config Terraform này."
  type        = string
  default     = "terraform-github-repos"
}

resource "github_repository" "self" {
  name        = var.self_repo_name
  description = "Terraform config to bulk-create GitHub repositories (repo1..repoN)"
  visibility  = "public"

  # auto_init = false để push được local commit sẵn có,
  # tránh "refusing to merge unrelated histories"
  auto_init = false

  has_issues   = true
  has_projects = false
  has_wiki     = false

  allow_merge_commit     = true
  allow_squash_merge     = true
  allow_rebase_merge     = true
  delete_branch_on_merge = true
}

output "self_repo_url" {
  description = "URL repo chứa config này."
  value       = github_repository.self.html_url
}

output "self_repo_clone_url" {
  description = "HTTPS clone URL, dùng cho git remote add origin."
  value       = github_repository.self.http_clone_url
}
