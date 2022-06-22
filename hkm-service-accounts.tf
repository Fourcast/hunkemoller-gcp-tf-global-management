module "global_management_service_accs" {
  # source = "./modules/iam/basic"
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//iam/basic"


  groups   = {}
  projects = {}
  folders  = {
    # "data-team-management" = {
    #     folder_id   = google_folder.data_team.name
    #     groups      = null
    #     sa          = {
    #         "${var.data_team_mgmt_project_sa_name}" = [
    #             "roles/bigquery.admin",
    #             "roles/storage.objectAdmin",
    #         ]
    #     }
    # }
    # "data-team-management-cloud-composer" = {
    #     folder_id   = google_folder.data_pipeline.name
    #     groups      = null
    #     sa          = {
    #         "${var.data_team_mgmt_project_sa_name}" = [
    #             "roles/composer.admin"
    #         ]
    #     }
    # }

    # "network-management" = {
    #     folder_id = google_folder.networking.name
    #     groups    = null
    #     sa        = {
    #         "${var.network_team_mgmt_project_sa_name}" = [
    #             "roles/compute.xpnAdmin",
    #             "roles/compute.networkAdmin",
    #             "roles/compute.securityAdmin"
    #         ]
    #     }
    # }

    #     "sandbox-management" = {
    #         folder_id = google_folder.sandboxes.name
    #         groups    = null
    #         sa        = {
    #             "${var.sandbox_mgmt_project_sa_name}" = [
    #                 "roles/resourcemanager.folderIamAdmin"
    #             ]
    #         }
    #     }
  }

  service_accounts = {
    # Manually created service accounts
    # SA for creating signed URLs
    "jesper-signurl-sa" = {
      email  = "jesper-signurl-sa@pj-hkm-global-management.iam.gserviceaccount.com"
      create = false
    }

    # Terraform cloud SA
    "hkm-tfcloud-sa" = {
      email  = "hkm-tfcloud-sa@pj-hkm-global-management.iam.gserviceaccount.com"
      create = false
    }

    "hkm-digital-receipts-sa" = {
      email  = "hkm-digital-receipts-sa-signed@pj-hkm-dev.iam.gserviceaccount.com"
      create = false
    }

    "hkm-digital-receipts-sa-dev" = {
      email  = "hkm-digital-receipts-dev@pj-hkm-dev.iam.gserviceaccount.com"
      create = false
    }

    "hkm-digital-receipts-sa-prod" = {
      email  = "hkm-sa-digital-receipts-prod@pj-hkm-prod.iam.gserviceaccount.com"
      create = false
    }

    "hkm-digital-receipts-sa-qa" = {
      email  = "hkm-sa-digital-receipts-qa@pj-hkm-qa.iam.gserviceaccount.com"
      create = false
    }

    "hkm-zeenea-sa-dev" = {
      email  = "zeenea-vm-sa@pj-hkm-zeenea-dev.iam.gserviceaccount.com"
      create = false
    }

    "hkm-zeenea-sa-prod" = {
      email  = "zeenea-vm-sa@pj-hkm-zeenea-prod.iam.gserviceaccount.com"
      create = false
    }

    "hkm-zeenea-connector-dev" = {
      email  = "zeenea-connector@pj-hkm-zeenea-dev.iam.gserviceaccount.com"
      create = false
    }

    "hkm-zeenea-connector-prod" = {
      email  = "zeenea-connector@pj-hkm-zeenea-prod.iam.gserviceaccount.com"
      create = false
    }

    # Service accounts to create via terraform
    # Data Team Management SA
    #     "${var.data_team_mgmt_project_sa_name}" = {
    #         servacc_name   = var.data_team_mgmt_project_sa_name
    #         gcp_project_id = var.data_team_mgmt_project_id
    #         description    = "Service account for data team management"
    #         display_name   = "Data Team Management SA"
    #     }

    #     # Network team management SA
    #     "${var.network_team_mgmt_project_sa_name}" = {
    #         servacc_name   = var.network_team_mgmt_project_sa_name
    #         gcp_project_id = var.network_team_mgmt_project_id
    #         description    = "Service account for networking management"
    #         display_name   = "Network Management SA"
    #     }

    #     # Sandbox management SA
    #     "${var.sandbox_mgmt_project_sa_name}" = {
    #         servacc_name   = var.sandbox_mgmt_project_sa_name
    #         gcp_project_id = var.sandbox_mgmt_project_id
    #         description    = "Service account for networking management"
    #         display_name   = "Network Management SA"
    #     }
  }
}