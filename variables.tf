variable "oauth_token_id" {}
variable "tfe_organization_name" {}
variable "tfe_agent_pool_name" {}
variable "tfe_workspace_auto_approve"{
    default = true
}
variable "tfe_workspace_terraform_version"{
    default = "1.0.3"
}
variable "application_name" {}


locals {
    github_visibility = "public"
    github_template_owner = "conmurphy"
    github_template_repository_name = "template_aci_single_bd_single_epg"

}


