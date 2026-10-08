variable "github_owner" {
  description = "User hoặc organization sở hữu repo. Để trống thì provider dùng env GITHUB_OWNER."
  type        = string
  default     = ""
}

variable "repo_count" {
  description = "Số lượng repo cần tạo (repo1..repoN)."
  type        = number
  default     = 10
}

variable "repo_prefix" {
  description = "Tiền tố tên repo."
  type        = string
  default     = "repo"
}

variable "visibility" {
  description = "public, private hoặc internal (internal chỉ dùng cho org)."
  type        = string
  default     = "private"

  validation {
    condition     = contains(["public", "private", "internal"], var.visibility)
    error_message = "visibility phải là public, private hoặc internal."
  }
}

variable "auto_init" {
  description = "Tạo kèm commit đầu tiên (README) để repo không rỗng."
  type        = bool
  default     = true
}

variable "default_branch" {
  description = "Tên branch mặc định. Chỉ áp dụng khi auto_init = true."
  type        = string
  default     = "main"
}

variable "gitignore_template" {
  description = "Template .gitignore của GitHub, ví dụ \"Terraform\". Để trống thì không thêm."
  type        = string
  default     = ""
}

variable "license_template" {
  description = "Template license, ví dụ \"mit\". Để trống thì không thêm."
  type        = string
  default     = ""
}

variable "topics" {
  description = "Topics gắn cho mọi repo."
  type        = list(string)
  default     = []
}
