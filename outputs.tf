output "repo_names" {
  description = "Tên các repo đã tạo."
  value       = sort([for r in github_repository.this : r.name])
}

output "repo_urls" {
  description = "URL HTML của từng repo."
  value       = { for k, r in github_repository.this : k => r.html_url }
}

output "clone_urls_ssh" {
  description = "SSH clone URL của từng repo."
  value       = { for k, r in github_repository.this : k => r.ssh_clone_url }
}
