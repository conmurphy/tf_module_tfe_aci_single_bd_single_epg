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

variable "endpoint_groups" {
    type = map
    default = {
        web = {
            bridge_domain_name  = "web"
            epg_name = "web"
            vds_name = "DM_VMM"
            bridge_domain_ip_and_mask = "10.1.10.1/24"
            arp_flood = null
            unicast_route =  null
            unknown_unicast_route =  null
        },
        db = {
            bridge_domain_name  = "db"
            epg_name = "db"
            vds_name = "DM_VMM"
            bridge_domain_ip_and_mask = "10.1.20.1/24"
            arp_flood = "yes"
            unicast_route =  null 
            unknown_unicast_route =  null 
        },
    }
}


resource "tfe_variable" "endpoint_groups" {
  key          = "endpoint_groups"
  value        = "${var.endpoint_groups}"
  category     = "terraform"
  workspace_id = tfe_workspace.tfe_workspace.id
  hcl = true
}

