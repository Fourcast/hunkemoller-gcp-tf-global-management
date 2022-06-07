###################
# Important note:
# A lot of the projects below were created using the google_project
#   resource. Any new projects should use the tf-gcp-modules-resource-manager
#   module. Search for "pj-selligent" for an example
###################
resource "google_project" "pj-global-management" {
  project_id = "pj-hkm-global-management"

  folder_id       = google_folder.global_management.name
  name            = "Global Management Project"
  billing_account = var.billing_account
}

resource "google_project" "pj-networking" {
  project_id = "pj-hkm-networking"

  folder_id       = google_folder.global_management.name
  name            = "Networking Project"
  billing_account = var.billing_account
}

resource "google_project" "pj-data-team-management" {
  project_id = "pj-hkm-data-team-management"

  folder_id       = google_folder.data_team.name
  name            = "Data Team Management Project"
  billing_account = var.billing_account
}

#############################
# Network projects          #
#############################
resource "google_project" "pj-network-host-data-team" {
  project_id = "pj-hkm-network-management"

  folder_id       = google_folder.networking.name
  name            = "Network Management"
  billing_account = var.billing_account
}


#############################
# Data team projects        #
#############################
#############################
# Data integration projects #
#############################
module "pj-dev-projects-base-tables" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-resource-manager"

  name     = "fl-dev-projects-base-tables"
  projects = {
    "Dev environement base tables" = "pj-hkm-dev-env-base-tables"
  }
  billing_account = var.billing_account
  parent          = google_folder.data_integration.name
}

module "pj-stocksplit" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-resource-manager"

  name     = "fl-stocksplit"
  projects = {
    "Stocksplit development" = "pj-hkm-stocksplit-dev"
    "Stocksplit staging"     = "pj-hkm-stocksplit-staging"
    "Stocksplit production"  = "pj-hkm-stocksplit-prod"
  }
  billing_account = var.billing_account
  parent          = google_folder.data_integration.name
}

module "pj-zeenea" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-resource-manager"

  name     = "fl-zeenea"
  projects = {
    "Zeenea development" = "pj-hkm-zeenea-dev"
    "Zeenea production"  = "pj-hkm-zeenea-prod"
  }
  billing_account = var.billing_account
  parent          = google_folder.data_integration.name
}

module "pj-manus" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-resource-manager"

  name     = "fl-manus"
  projects = {
    "Manus development" = "pj-hkm-manus-dev"
    "Manus production"  = "pj-hkm-manus-prod"
  }
  billing_account = var.billing_account
  parent          = google_folder.data_integration.name
}

module "pj-vpc-hunkemoller" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-resource-manager"

  name     = "fl-hunkemoller-vpc"
  projects = {
    "HKM VPC Host" = "pj-hkm-vpc-host"
  }
  billing_account = var.billing_account
  parent          = google_folder.hunkemoller.name
}


# module "pj-workday" {
#     source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-resource-manager"

#     name = "fl-workday"
#     projects = {
#         "Workday development" = "pj-hkm-workday-dev"
#         "Workday staging"     = "pj-hkm-workday-staging"
#         "Workday production"  = "pj-hkm-workday-prod"
#     }
#     billing_account = var.billing_account
#     parent = google_folder.data_integration.name
# }

# module "pj-commerce-cloud" {
#     source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-resource-manager"

#     name = "fl-commerce-cloud"
#     projects = {
#         "SFCC development" = "pj-hkm-sfcc-dev"
#         "SFCC staging"     = "pj-hkm-sfcc-staging"
#         "SFCC production"  = "pj-hkm-sfcc-prod"
#     }
#     billing_account = var.billing_account
#     parent = google_folder.data_integration.name
# }

# module "pj-sap-bw-to-bq" {
#     source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-resource-manager"

#     name = "fl-sap-bw-to-bq"
#     projects = {
#         "SAP BW to BigQuery" = "pj-sap-bw-to-bq"
#     }
#     billing_account = var.billing_account
#     parent = google_folder.data_integration.name
# }

module "pj-selligent" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-resource-manager"

  name     = "fl-selligent"
  projects = {
    "Selligent development" = "pj-hkm-selligent-dev"
    "Selligent staging"     = "pj-hkm-selligent-staging"
    "Selligent production"  = "pj-hkm-selligent-prod"
  }
  billing_account = var.billing_account
  parent          = google_folder.data_integration.name
}

resource "google_project" "pj-notificare-dev" {
  project_id = "pj-hkm-notificare-dev"

  folder_id       = google_folder.notificare.name
  name            = "Notificare development"
  billing_account = var.billing_account
}

resource "google_project" "pj-notificare-staging" {
  project_id = "pj-hkm-notificare-staging"

  folder_id       = google_folder.notificare.name
  name            = "Notificare staging"
  billing_account = var.billing_account
}

resource "google_project" "pj-notificare-prod" {
  project_id = "pj-hkm-notificare-production"

  folder_id       = google_folder.notificare.name
  name            = "Notificare production"
  billing_account = var.billing_account
}

resource "google_project" "pj-sap-dev" {
  project_id = "pj-hkm-sap-dev"

  folder_id       = google_folder.sap.name
  name            = "SAP development"
  billing_account = var.billing_account
}

resource "google_project" "pj-sap-staging" {
  project_id = "pj-hkm-sap-staging"

  folder_id       = google_folder.sap.name
  name            = "SAP staging"
  billing_account = var.billing_account
}

resource "google_project" "pj-sap-prod" {
  project_id = "pj-hkm-sap-production"

  folder_id       = google_folder.sap.name
  name            = "SAP production"
  billing_account = var.billing_account
}

resource "google_project" "pj-service-cloud-dev" {
  project_id = "pj-hkm-service-cloud-dev"

  folder_id       = google_folder.service_cloud.name
  name            = "Salesforce Service Cloud dev"
  billing_account = var.billing_account
}

resource "google_project" "pj-service-cloud-staging" {
  project_id = "pj-hkm-service-cloud-staging"

  folder_id       = google_folder.service_cloud.name
  name            = "Salesforce Service Cloud stage"
  billing_account = var.billing_account
}

resource "google_project" "pj-service-cloud-prod" {
  project_id = "pj-hkm-service-cloud-prod"

  folder_id       = google_folder.service_cloud.name
  name            = "Salesforce Service Cloud prod"
  billing_account = var.billing_account
}

resource "google_project" "pj-people-counter-dev" {
  project_id = "pj-people-counter-dev"

  folder_id       = google_folder.people_counter.name
  name            = "People Counter dev"
  billing_account = var.billing_account
}

resource "google_project" "pj-people-counter-staging" {
  project_id = "pj-people-counter-staging"

  folder_id       = google_folder.people_counter.name
  name            = "People Counter staging"
  billing_account = var.billing_account
}

resource "google_project" "pj-people-counter-prod" {
  project_id = "pj-people-counter-prod"

  folder_id       = google_folder.people_counter.name
  name            = "People Counter prod"
  billing_account = var.billing_account
}

resource "google_project" "pj-oil-dev" {
  project_id = "pj-oil-dev"

  folder_id       = google_folder.oil.name
  name            = "OIL dev"
  billing_account = var.billing_account
}

resource "google_project" "pj-oil-staging" {
  project_id = "pj-oil-staging"

  folder_id       = google_folder.oil.name
  name            = "OIL staging"
  billing_account = var.billing_account
}

resource "google_project" "pj-oil-prod" {
  project_id = "pj-oil-prod"

  folder_id       = google_folder.oil.name
  name            = "OIL production"
  billing_account = var.billing_account
}

#############################
# Data pipeline projects #
#############################
resource "google_project" "pj-data-pipeline-dev" {
  project_id = "pj-data-pipeline-devel"

  folder_id       = google_folder.data_pipeline.name
  name            = "Data pipeline development"
  billing_account = var.billing_account
}

resource "google_project" "pj-data-pipeline-stage" {
  project_id = "pj-data-pipeline-staging"

  folder_id       = google_folder.data_pipeline.name
  name            = "Data pipeline staging"
  billing_account = var.billing_account
}

resource "google_project" "pj-data-pipeline-prod" {
  project_id = "pj-data-pipeline-prod"

  folder_id       = google_folder.data_pipeline.name
  name            = "Data pipeline production"
  billing_account = var.billing_account
}

# HKM Projects
resource "google_project" "pj-hkm-prod" {
  project_id = "pj-hkm-prod"

  folder_id       = google_folder.hunkemoller.name
  name            = "HKM production"
  billing_account = var.billing_account
}

resource "google_project" "pj-hkm-dev" {
  project_id = "pj-hkm-dev"

  folder_id       = google_folder.hunkemoller.name
  name            = "HKM development"
  billing_account = var.billing_account
}

resource "google_project" "pj-hkm-qa" {
  project_id = "pj-hkm-qa"

  folder_id       = google_folder.hunkemoller.name
  name            = "HKM qa"
  billing_account = var.billing_account
}

######################
# Data mart projects #
######################
# module "pj-data-marts" {
#     source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-resource-manager"

#     name = "fl-data-marts"
#     projects = {
#         "Data marts development" = "pj-hkm-data-marts-dev"
#         "Data marts staging"     = "pj-hkm-data-marts-staging" 
#         "Data marts production"  = "pj-hkm-data-marts-prod"
#     }
#     billing_account = var.billing_account
#     parent = google_folder.data_team.name
# }

######################
# Sandbox projects   #
######################
# resource "google_project" "pj-sandbox-management" {
#     project_id = "pj-sandbox-management"

#     folder_id       = google_folder.sandboxes.name
#     name            = "Sandbox Management"
#     billing_account = var.billing_account
# }