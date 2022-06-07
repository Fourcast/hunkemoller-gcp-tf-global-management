resource "google_project_service" "enable_bigquery_base_tables" {
  project                    = "pj-hkm-dev-env-base-tables"
  service                    = "bigquery.googleapis.com"
  disable_dependent_services = true

  depends_on = [
    module.pj-dev-projects-base-tables
  ]
}

resource "google_project_service" "enable_cloudbuild_globally" {
  project                    = google_project.pj-global-management.project_id
  service                    = "cloudbuild.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "enable_firestore" {
  project                    = google_project.pj-oil-dev.project_id
  service                    = "firestore.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "enable_app_engine" {
  project                    = google_project.pj-oil-dev.project_id
  service                    = "appengine.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "enable_app_engine_mgpr" {
  project                    = google_project.pj-global-management.project_id
  service                    = "appengine.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "cloud_build_oil_dev" {
  project                    = google_project.pj-oil-dev.project_id
  service                    = "cloudbuild.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "cloud_build_oil_stage" {
  project                    = google_project.pj-oil-staging.project_id
  service                    = "cloudbuild.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "cloud_build_oil_prod" {
  project                    = google_project.pj-oil-prod.project_id
  service                    = "cloudbuild.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "cloud_build_pipeline_dev" {
  project                    = google_project.pj-data-pipeline-dev.project_id
  service                    = "cloudbuild.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "cloud_build_pipeline_stage" {
  project                    = google_project.pj-data-pipeline-stage.project_id
  service                    = "cloudbuild.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "cloud_build_pipeline_prod" {
  project                    = google_project.pj-data-pipeline-prod.project_id
  service                    = "cloudbuild.googleapis.com"
  disable_dependent_services = true
}

resource "google_project_service" "enable_bigquery_manus_prod" {
  project                    = "pj-hkm-manus-prod"
  service                    = "bigquery.googleapis.com"
  disable_dependent_services = false

  depends_on = [
    module.pj-manus
  ]
}

resource "google_project_service" "enable_bigquery_manus_dev" {
  project                    = "pj-hkm-manus-dev"
  service                    = "bigquery.googleapis.com"
  disable_dependent_services = false

  depends_on = [
    module.pj-manus
  ]
}

resource "google_project_service" "enable_compute_engine_api_hkm_prod" {
  project                    = "pj-hkm-prod"
  service                    = "compute.googleapis.com"
  disable_dependent_services = false
}

resource "google_project_service" "enable_compute_engine_api_hkm_dev" {
  project                    = "pj-hkm-dev"
  service                    = "compute.googleapis.com"
  disable_dependent_services = false
}

resource "google_project_service" "enable_compute_engine_api_hkm_qa" {
  project                    = "pj-hkm-qa"
  service                    = "compute.googleapis.com"
  disable_dependent_services = false
}

resource "google_project_service" "enable_kubernetes_engine_api_hkm_dev" {
  project                    = "pj-hkm-dev"
  service                    = "container.googleapis.com"
  disable_dependent_services = false
}

resource "google_project_service" "enable_kubernetes_engine_api_hkm_prod" {
  project                    = "pj-hkm-prod"
  service                    = "container.googleapis.com"
  disable_dependent_services = false
}

resource "google_project_service" "enable_kubernetes_engine_api_hkm_qa" {
  project                    = "pj-hkm-qa"
  service                    = "container.googleapis.com"
  disable_dependent_services = false
}

resource "google_project_service" "hkm_enable_global_management" {
  project                    = "pj-hkm-global-management"
  service                    = "container.googleapis.com"
  disable_dependent_services = false
}

resource "google_project_service" "hkm_enable_hkm_vpc_host" {
  project                    = "pj-hkm-vpc-host"
  service                    = "container.googleapis.com"
  disable_dependent_services = false
}