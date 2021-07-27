data "tfe_agent_pool" "agent_pool" {
  name          = var.tfe_agent_pool_name
  organization  = var.tfe_organization_name
}


resource "tfe_workspace" "tfe_workspace" {
  name           = "aci_application_${var.application_name}"
  organization   = var.tfe_organization_name
  execution_mode = "agent"
  agent_pool_id = data.tfe_agent_pool.agent_pool.id
  auto_apply = var.tfe_workspace_auto_approve
  terraform_version = var.tfe_workspace_terraform_version

  vcs_repo {
    identifier = github_repository.github_repository.full_name
    oauth_token_id = var.oauth_token_id
  }
  depends_on = [github_repository.github_repository]
}