resource "google_project_service" "enable_bigquery_base_tables" {
    project = "pj-hkm-dev-env-base-tables"
    service = "bigquery.googleapis.com"
    disable_dependent_services = true

    depends_on = [
        module.pj-dev-projects-base-tables
    ]
}

resource "google_project_service" "enable_cloudbuild_globally" {
    project = google_project.pj-global-management.project_id
    service = "cloudbuild.googleapis.com"
    disable_dependent_services = true
}

resource "google_project_service" "enable_firestore" {
    project = google_project.pj-oil-dev.project_id
    service = "firestore.googleapis.com"
    disable_dependent_services = true
}

resource "google_project_service" "enable_app_engine" {
    project = google_project.pj-oil-dev.project_id
    service = "appengine.googleapis.com"
    disable_dependent_services = true
}

resource "google_project_service" "enable_app_engine_mgpr" {
    project = google_project.pj-global-management.project_id
    service = "appengine.googleapis.com"
    disable_dependent_services = true
}

resource "google_project_service" "cloud_build_oil_dev" {
    project = google_project.pj-oil-dev.project_id
    service = "cloudbuild.googleapis.com"
    disable_dependent_services = true
}

resource "google_project_service" "cloud_build_oil_stage" {
    project = google_project.pj-oil-staging.project_id
    service = "cloudbuild.googleapis.com"
    disable_dependent_services = true
}

resource "google_project_service" "cloud_build_oil_prod" {
    project = google_project.pj-oil-prod.project_id
    service = "cloudbuild.googleapis.com"
    disable_dependent_services = true
}

resource "google_project_service" "cloud_build_pipeline_dev" {
    project = google_project.pj-data-pipeline-dev.project_id
    service = "cloudbuild.googleapis.com"
    disable_dependent_services = true
}

resource "google_project_service" "cloud_build_pipeline_stage" {
    project = google_project.pj-data-pipeline-stage.project_id
    service = "cloudbuild.googleapis.com"
    disable_dependent_services = true
}

resource "google_project_service" "cloud_build_pipeline_prod" {
    project = google_project.pj-data-pipeline-prod.project_id
    service = "cloudbuild.googleapis.com"
    disable_dependent_services = true
}