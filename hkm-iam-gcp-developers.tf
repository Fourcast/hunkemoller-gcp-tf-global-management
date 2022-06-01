###################
# FOLDER BINDINGS #
###################
module "developers_set_folder_iam_data_integration" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

  folder_id = google_folder.data_integration.name
  bindings  = {
    "group:gcp-developers@hunkemoller.com" = ["roles/resourcemanager.folderViewer"],
  }
}

module "developers_set_folder_iam_oil" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

  folder_id = google_folder.oil.name
  bindings  = {
    "group:gcp-developers@hunkemoller.com" = var.bigquery_reader,
  }
}

module "developers_set_folder_iam_sap_bw_to_bq" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

  folder_id = "folders/251505477721"
  bindings  = {
    "group:gcp-developers@hunkemoller.com" = var.bigquery_reader,
  }
}

module "developers_set_folder_iam_people_counter" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

  folder_id = google_folder.people_counter.name
  bindings  = {
    "group:gcp-developers@hunkemoller.com" = var.bigquery_reader,
  }
}

module "developers_set_folder_iam_notificare" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

  folder_id = google_folder.notificare.name
  bindings  = {
    "group:gcp-developers@hunkemoller.com"            = var.bigquery_reader,
    "group:gcp-vendor-cleverstrategy@hunkemoller.com" = [
      "roles/bigquery.dataEditor", "roles/bigquery.jobUser", "roles/bigquery.readSessionUser"
    ]
  }
}

# Group requires more granular access, temporarily
# module "developers_set_folder_iam_stocksplit" {
#     source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

#     folder_id = module.pj-stocksplit.folder_id
#     bindings = {
#         "group:gcp-developers@hunkemoller.com" = var.bigquery_reader,
#     }
# }

module "developers_set_folder_iam_commerce_cloud" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

  folder_id = "folders/218592080829"
  bindings  = {
    "group:gcp-developers@hunkemoller.com" = var.bigquery_reader,
  }
}

module "developers_set_folder_iam_service_cloud" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

  folder_id = google_folder.service_cloud.name
  bindings  = {
    "group:gcp-developers@hunkemoller.com" = var.bigquery_reader,
  }
}

module "developers_set_folder_iam_selligent" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

  folder_id = module.pj-selligent.folder_id
  bindings  = {
    "group:gcp-developers@hunkemoller.com" = var.bigquery_reader,
  }
}

module "developers_set_folder_iam_sap" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

  folder_id = google_folder.sap.name
  bindings  = {
    "group:gcp-developers@hunkemoller.com" = var.bigquery_reader,
  }
}

module "developers_set_folder_iam_workday" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

  folder_id = "folders/193369994289"
  bindings  = {
    "group:gcp-project-workday@hunkemoller.com" = var.bigquery_reader,
  }
}

module "developers_set_folder_iam_data_marts" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

  folder_id = "folders/762689581202"
  bindings  = {
    "group:gcp-developers@hunkemoller.com"     = var.bigquery_writer,
    "group:gcp-data_analytics@hunkemoller.com" = var.bigquery_reader,
  }
}

module "developers_set_project_selligent_datalake" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-project/iam_project_binding"

  project_id = "selligent-datalake"
  bindings   = {
    "group:gcp-developers@hunkemoller.com"                                              = var.bigquery_reader,
    "serviceAccount:sds-smc-hkm-connection2@selligent-datalake.iam.gserviceaccount.com" = var.bigquery_reader
  }
}


####################
# PROJECT BINDINGS #
####################
module "developers_set_pj_iam_stocksplit_dev" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-project/iam_project_member"

  project_id = "pj-hkm-stocksplit-dev"
  role       = var.bigquery_writer

  member = "group:gcp-developers@hunkemoller.com"
}

module "developers_set_pj_iam_stocksplit_dev_2" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-project/iam_project_member"

  project_id = "pj-hkm-stocksplit-dev"
  role       = ["roles/bigquery.readSessionUser"]

  member = "group:gcp-developers@hunkemoller.com"
}

module "developers_set_pj_iam_stocksplit_stage" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-project/iam_project_member"

  project_id = "pj-hkm-stocksplit-staging"
  role       = var.bigquery_reader

  member = "group:gcp-developers@hunkemoller.com"
}

module "developers_set_pj_iam_stocksplit_prod" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-project/iam_project_member"

  project_id = "pj-hkm-stocksplit-prod"
  role       = var.bigquery_reader

  member = "group:gcp-developers@hunkemoller.com"
}

# Zeenea IAM
module "developers_set_pj_iam_zeenea_prod" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-project/iam_project_member"

  project_id = "pj-hkm-zeenea-prod"
  role       = var.bigquery_reader

  member = "group:gcp-developers@hunkemoller.com"
}

module "developers_set_pj_iam_zeenea_dev" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-project/iam_project_member"

  project_id = "pj-hkm-zeenea-dev"
  role       = var.bigquery_reader

  member = "group:gcp-developers@hunkemoller.com"
}

module "developers_set_pj_iam_manus_prod" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-project/iam_project_member"

  project_id = "pj-hkm-manus-prod"
  role       = var.bigquery_reader

  member = "group:gcp-developers@hunkemoller.com"
}

module "developers_set_pj_iam_manus_dev" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-project/iam_project_member"

  project_id = "pj-hkm-manus-dev"
  role       = var.bigquery_reader

  member = "group:gcp-developers@hunkemoller.com"
}