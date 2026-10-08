locals {
  repo_names = [for i in range(1, var.repo_count + 1) : "${var.repo_prefix}${i}"]
}

resource "github_repository" "this" {
  for_each = toset(local.repo_names)

  name        = each.value
  description = "Managed by Terraform"
  visibility  = var.visibility

  auto_init          = var.auto_init
  gitignore_template = var.gitignore_template != "" ? var.gitignore_template : null
  license_template   = var.license_template != "" ? var.license_template : null
  topics             = var.topics

  has_issues   = true
  has_projects = false
  has_wiki     = false

  allow_merge_commit     = true
  allow_squash_merge     = true
  allow_rebase_merge     = true
  delete_branch_on_merge = true
}

resource "github_branch_default" "this" {
  for_each = var.auto_init ? toset(local.repo_names) : toset([])

  repository = github_repository.this[each.value].name
  branch     = var.default_branch
}
