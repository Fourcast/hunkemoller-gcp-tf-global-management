###########
# Important note:
# Only top level folders and sandbox folders should be defined here.
# There are currently more folders here that were created before the
#   tf-gcp-modules-resource-manager was implemented and those cannot be removed
###########

# Top level folders
resource "google_folder" "global_management" {
  display_name = "fl-global-management"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "networking" {
  display_name = "fl-networking"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "sandboxes" {
  display_name = "fl-sandboxes"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "data_team" {
  display_name = "fl-data-team"
  parent       = "organizations/${var.org_id}"
}

resource "google_folder" "hunkemoller" {
  display_name = "fl-hunkemoller"
  parent       = "organizations/${var.org_id}"
}

# "Data team" subfolders
resource "google_folder" "data_lake" {
  display_name = "fl-data-lake"
  parent       = google_folder.data_team.name
}

resource "google_folder" "data_warehouse" {
  display_name = "fl-data-warehouse"
  parent       = google_folder.data_team.name
}

resource "google_folder" "data_pipeline" {
  display_name = "fl-data-pipeline"
  parent       = google_folder.data_team.name
}

resource "google_folder" "data_integration" {
  display_name = "fl-data-integration"
  parent       = google_folder.data_team.name
}

resource "google_folder" "data_zeenea" {
  display_name = "fl-zeenea-integration"
  parent       = google_folder.data_team.name
}

# "Data integration" subfolders
resource "google_folder" "notificare" {
  display_name = "fl-notificare"
  parent       = google_folder.data_integration.name
}

resource "google_folder" "sap" {
  display_name = "fl-sap"
  parent       = google_folder.data_integration.name
}

resource "google_folder" "service_cloud" {
  display_name = "fl-service-cloud"
  parent       = google_folder.data_integration.name
}

resource "google_folder" "people_counter" {
  display_name = "fl-people-counter"
  parent       = google_folder.data_integration.name
}

resource "google_folder" "oil" {
  display_name = "fl-oil"
  parent       = google_folder.data_integration.name
}

# Sandbox folders
resource "google_folder" "devoteam_phuong" {
  display_name = "SB-Phuong-Anh-Nguyen"
  parent       = google_folder.sandboxes.name
}

resource "google_folder" "devoteam_jesper" {
  display_name = "SB-Jesper-Bergeskans"
  parent       = google_folder.sandboxes.name
}

resource "google_folder" "hkm_remko_buijink" {
  display_name = "SB-Remko-Buijink"
  parent       = google_folder.sandboxes.name
}

resource "google_folder" "hkm_bhakti_bagkar" {
  display_name = "SB-Bhakti-Bagkar"
  parent       = google_folder.sandboxes.name
}

resource "google_folder" "hkm_dwan_thompson" {
  display_name = "SB-Dwan-Thompson"
  parent       = google_folder.sandboxes.name
}

resource "google_folder" "hkm_marko_lubina" {
  display_name = "SB-Marko-Lubina"
  parent       = google_folder.sandboxes.name
}

resource "google_folder" "hkm_patrick_van_heumen" {
  display_name = "SB-Patrick-van-Heumen"
  parent       = google_folder.sandboxes.name
}

resource "google_folder" "hkm_tessa_van_den_bergh" {
  display_name = "SB-Tessa_van_den_Bergh"
  parent       = google_folder.sandboxes.name
}

resource "google_folder" "hkm_teus_van_ingen" {
  display_name = "SB-Teus_van_Ingen"
  parent       = google_folder.sandboxes.name
}

resource "google_folder" "hkm_katharine_suwarso" {
  display_name = "SB-Katharine-Suwarso"
  parent       = google_folder.sandboxes.name
}

resource "google_folder" "hkm_kenita_hadi" {
  display_name = "SB-Kenita-Hadi"
  parent       = google_folder.sandboxes.name
}

resource "google_folder" "hkm_jonathan_tjandra" {
  display_name = "SB-Jonathan-Tjandra"
  parent       = google_folder.sandboxes.name
}

resource "google_folder" "hkm_bozena_kowalska" {
  display_name = "SB-Bozena-Kowalska"
  parent       = google_folder.sandboxes.name
}

resource "google_folder" "hkm_hanna_myhal" {
  display_name = "SB-Hanna-Myhal"
  parent       = google_folder.sandboxes.name
}

resource "google_folder" "hkm_stefan_neacsu" {
  display_name = "SB-Stefan-Neacsu"
  parent       = google_folder.sandboxes.name
}