variable "tfe_variables" {
  type = list(string)
  default = ["apic_username", "apic_url","tenant_name", "vrf_name", "application_profile_name"]
}

variable "tfe_sensitive_variables" {
  type = list(string)
  default = ["apic_password"]
}

resource "tfe_variable" "tfe_variable" {
  for_each = toset(var.tfe_variables)
  key          = each.key
  value        = each.key
  category     = "terraform"
  workspace_id = tfe_workspace.tfe_workspace.id
}

resource "tfe_variable" "tfe_sensitive_variable" {
  for_each = toset(var.tfe_sensitive_variables)
  key          = each.key
  value        = each.key
  category     = "terraform"
  workspace_id = tfe_workspace.tfe_workspace.id
  sensitive = true
}

resource "tfe_variable" "endpoint_groups" {
  key          = "endpoint_groups"
  value        = "['epg1', 'epg2', 'epg3']"
  category     = "terraform"
  workspace_id = tfe_workspace.tfe_workspace.id
  hcl = true
}

