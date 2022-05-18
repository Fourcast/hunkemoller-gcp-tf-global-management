resource "google_app_engine_application" "firestore_test" {
    project         = google_project.pj-oil-dev.project_id
    location_id     = "europe-west"
    database_type   = "CLOUD_FIRESTORE"
}

resource "google_project_service" "enable_firestore" {
    project = google_project.pj-oil-dev.project_id
    service = "firestore.googleapis.com"
    disable_dependent_services = true
}