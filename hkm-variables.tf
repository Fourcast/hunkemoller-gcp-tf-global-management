# Folder variables
variable "org_id" {
    type        = string
    description = "Organization ID taken from GCP"
}

# Project variables
variable "billing_account" {
  type        = string
  description = "The ID of the billing account to associate the project with."

  validation {
    condition     = can(regex("^[0-9A-F]{6}-[0-9A-F]{6}-[0-9A-F]{6}$", var.billing_account))
    error_message = "Must be in format of \"6 hex\"-\"6 hex\"-\"6 hex\"."
  }
}

#### DEFAULT ROLES ####
variable sandbox_roles {
  type        = list(string)
  description = "Roles to give out to a users sandbox"
  default     = ["roles/resourcemanager.projectCreator", "roles/owner", "roles/resourcemanager.folderAdmin"]
}

variable bigquery_users {
  type        = list(string)
  description = "Standard roles to give out to a bigquery users in a project"
  default     = ["roles/bigquery.dataEditor"]
}

# Top level service accounts
variable data_team_mgmt_project_id {
  description = "Project ID of Data Team management project"
  type        = string
}

variable data_team_mgmt_project_sa_name {
  description = "Data Team management service account name"
  type        = string
}

variable network_team_mgmt_project_id {
  description = "Project ID of Network team management project"
  type        = string
}

variable network_team_mgmt_project_sa_name {
  description = "Network team management service account name"
  type        = string
}

variable sandbox_mgmt_project_id {
  description = "Project ID of sandbox management project"
  type        = string
}

variable sandbox_mgmt_project_sa_name {
  description = "Sandbox management service account name"
  type        = string
}