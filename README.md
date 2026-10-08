# Tạo 10 GitHub repo bằng Terraform

Tạo `repo1` → `repo10` bằng provider [integrations/github](https://registry.terraform.io/providers/integrations/github/latest).

## 1. Chuẩn bị token

Tạo Personal Access Token tại https://github.com/settings/tokens

- **Classic token**: cần scope `repo` (và `delete_repo` nếu muốn `terraform destroy`). Nếu tạo repo trong organization thì thêm `admin:org`.
- **Fine-grained token**: Repository permissions → `Administration: Read and write`.

```bash
export GITHUB_TOKEN="ghp_xxxxxxxxxxxx"
export GITHUB_OWNER="your-github-username"   # hoặc set github_owner trong tfvars
```

## 2. Chạy

```bash
terraform init
terraform plan
terraform apply
```

## 3. Tuỳ chỉnh

```bash
cp terraform.tfvars.example terraform.tfvars
```

| Biến | Mặc định | Ý nghĩa |
|---|---|---|
| `repo_count` | `10` | Số repo (`repo1`..`repoN`) |
| `repo_prefix` | `repo` | Tiền tố tên repo |
| `visibility` | `private` | `public` / `private` / `internal` |
| `auto_init` | `true` | Tạo kèm README để repo không rỗng |
| `default_branch` | `main` | Branch mặc định |
| `gitignore_template` | `""` | Ví dụ `Terraform` |
| `license_template` | `""` | Ví dụ `mit` |
| `topics` | `[]` | Topics gắn cho mọi repo |

Đổi số lượng repo không cần sửa code:

```bash
terraform apply -var='repo_count=20'
```

## Import repo đã tồn tại

Nếu `repo3` đã có trên GitHub, `apply` sẽ lỗi `name already exists`. Import vào state trước:

```bash
terraform import 'github_repository.this["repo3"]' repo3
```

## Xoá

```bash
terraform destroy    # cần scope delete_repo
```
