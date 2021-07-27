
resource "github_repository" "github_repository" {
  name        = "aci_application_${var.application_name}"
  description = "Created by Terraform TFE workflow"

  visibility = local.github_visibility

  template {
    owner      = local.github_template_owner
    repository = local.github_template_repository_name
  }
}