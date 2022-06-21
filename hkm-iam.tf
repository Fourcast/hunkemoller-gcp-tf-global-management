#################################
# Data Integratiojn permissions #
#################################
module "set_folder_iam_stocksplit" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

  folder_id = module.pj-stocksplit.folder_id
  bindings  = {
    "user:patrick.van.heumen@hunkemoller.com" = var.bigquery_users,
    "user:remko.buijink@hunkemoller.com"      = var.bigquery_users
  }
}

# Networking IAM
module "set_folder_iam_shared_vpc" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

  folder_id = google_folder.networking.name
  bindings  = {
    "serviceAccount:hkm-tfcloud-sa@pj-hkm-global-management.iam.gserviceaccount.com" = ["roles/compute.xpnAdmin"]
  }
}

# Giving service accounts for CC instance dataViewer for the base tables
# Should be enough to allow for tables to be copied
module "set_folder_iam_base_tables" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-project/iam_project_binding"

  project_id = "pj-hkm-dev-env-base-tables"
  bindings   = {
    "serviceAccount:cc-sa-1032604889204@pj-data-pipeline-devel.iam.gserviceaccount.com" = [
      "roles/bigquery.dataViewer"
    ],
    "serviceAccount:cc-sa-632753434802@pj-data-pipeline-staging.iam.gserviceaccount.com" = [
      "roles/bigquery.dataViewer"
    ],
    "serviceAccount:cc-sa-841149115454@pj-data-pipeline-prod.iam.gserviceaccount.com" = ["roles/bigquery.dataViewer"]
  }

  depends_on = [
    module.pj-dev-projects-base-tables,
    google_project_service.enable_bigquery_base_tables
  ]
}

#######################
# Sandbox permissions #
#######################
module "set_folder_iam_jesper" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

  folder_id = google_folder.devoteam_jesper.name
  bindings  = {
    "user:jesper.bergeskans@hunkemoller.com" = var.sandbox_roles
  }
}

module "set_folder_iam_phuong" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

  folder_id = google_folder.devoteam_phuong.name
  bindings  = {
    "user:phuong.anh.nguyen@hunkemoller.com" = var.sandbox_roles
  }
}

module "set_folder_iam_bhakti_bagkar" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

  folder_id = google_folder.hkm_bhakti_bagkar.name
  bindings  = {
    "user:bhakti.bagkar@hunkemoller.com" = var.sandbox_roles
  }
}

module "set_folder_iam_katharine_suwarso" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

  folder_id = google_folder.hkm_katharine_suwarso.name
  bindings  = {
    "user:katharine.suwarso@hunkemoller.com" = var.sandbox_roles
  }
}

module "set_folder_iam_hanna_myhal" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

  folder_id = google_folder.hkm_hanna_myhal.name
  bindings  = {
    "user:Hanna.Myhal@hunkemoller.com" = var.sandbox_roles
  }
}

module "set_folder_iam_bozena_kowalska" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

  folder_id = google_folder.hkm_bozena_kowalska.name
  bindings  = {
    "user:Bozena.Kowalska@hunkemoller.com" = var.sandbox_roles
  }
}

module "set_folder_iam_jonathan_tjandra" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

  folder_id = google_folder.hkm_jonathan_tjandra.name
  bindings  = {
    "user:jonathan.tjandra@hunkemoller.com" = var.sandbox_roles
  }
}

module "set_folder_iam_kenita_hadi" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

  folder_id = google_folder.hkm_kenita_hadi.name
  bindings  = {
    "user:kenita.hadi@hunkemoller.com" = var.sandbox_roles
  }
}

# TODO: All these resources should be converted to using the iam_folder_binding
resource "google_folder_iam_member" "set_folder_iam_remko_buijink" {
  count  = length(var.sandbox_roles)
  folder = google_folder.hkm_remko_buijink.name
  role   = var.sandbox_roles[count.index]
  member = "user:remko.buijink@hunkemoller.com"
}

# resource "google_folder_iam_member" "set_folder_iam_bhakti_bagkar" {
#     count = length(var.sandbox_roles)
#     folder = google_folder.hkm_bhakti_bagkar.name
#     role = var.sandbox_roles[count.index]
#     member = "user:bhakti.bagkar@hunkemoller.com"
# }

resource "google_folder_iam_member" "set_folder_iam_dwan_thompson" {
  count  = length(var.sandbox_roles)
  folder = google_folder.hkm_dwan_thompson.name
  role   = var.sandbox_roles[count.index]
  member = "user:Dwan.Thompson@hunkemoller.com"
}

resource "google_folder_iam_member" "set_folder_iam_marko_lubina" {
  count  = length(var.sandbox_roles)
  folder = google_folder.hkm_marko_lubina.name
  role   = var.sandbox_roles[count.index]
  member = "user:marko.lubina@hunkemoller.com"
}

resource "google_folder_iam_member" "set_folder_iam_patrick_van_heumen" {
  count  = length(var.sandbox_roles)
  folder = google_folder.hkm_patrick_van_heumen.name
  role   = var.sandbox_roles[count.index]
  member = "user:patrick.van.heumen@hunkemoller.com"
}

resource "google_folder_iam_member" "set_folder_iam_tessa_van_den_bergh" {
  count  = length(var.sandbox_roles)
  folder = google_folder.hkm_tessa_van_den_bergh.name
  role   = var.sandbox_roles[count.index]
  member = "user:tessa.van.den.bergh@hunkemoller.com"
}

resource "google_folder_iam_member" "set_folder_iam_teus_van_ingen" {
  count  = length(var.sandbox_roles)
  folder = google_folder.hkm_teus_van_ingen.name
  role   = var.sandbox_roles[count.index]
  member = "user:teus.van.ingen@hunkemoller.com"
}

## GKE IAMs needed in order to work with private setup
resource "google_project_iam_member" "set_project_vpc_k8s_sa" {
  project = "pj-hkm-vpc-host"
  role    = "roles/compute.networkUser"
  member  = "serviceAccount:service-774664708692@container-engine-robot.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "set_project_vpc_k8s_sa_host_agent" {
  project = "pj-hkm-vpc-host"
  role    = "roles/container.hostServiceAgentUser"
  member  = "serviceAccount:service-774664708692@container-engine-robot.iam.gserviceaccount.com"
}


resource "google_project_iam_member" "set_project_vpc_k8s_cloud_services" {
  project = "pj-hkm-vpc-host"
  role    = "roles/compute.networkUser"
  member  = "serviceAccount:774664708692@cloudservices.gserviceaccount.com"
}

resource "google_project_iam_member" "set_project_vpc_k8s_cloud_services_editor" {
  project = "pj-hkm-vpc-host"
  role    = "roles/editor"
  member  = "serviceAccount:774664708692@cloudservices.gserviceaccount.com"
}

resource "google_project_iam_member" "digital_receipts_sa_signed_url_storage_admin" {
  project = "pj-hkm-dev"
  role    = "roles/storage.admin"
  member  = "serviceAccount:hkm-digital-receipts-sa-signed@pj-hkm-dev.iam.gserviceaccount.com"
}

resource "google_project_iam_member" "digital_receipts_sa_signed_url_sa_token_creator" {
  project = "pj-hkm-dev"
  role    = "roles/iam.serviceAccountTokenCreator"
  member  = "serviceAccount:hkm-digital-receipts-sa-signed@pj-hkm-dev.iam.gserviceaccount.com"
}

# Bastion host SA
module "bastion_host_sa_iam" {
  source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-project/iam_project_binding"

  project = "pj-hkm-dev"
  bindings  = {
    "serviceAccount:" = ["roles/compute.osLogin", "roles/iam.serviceAccountUser", "roles/compute.instanceAdmin.v1",
        "roles/iap.tunnelResourceAccessor", "projects/pj-housinganywhere-dev/roles/osLoginProjectGet_987c",
        "roles/container.clusterViewer", "roles/storage.objectAdmin"]
  }
}