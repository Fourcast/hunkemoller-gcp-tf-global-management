resource "google_project_service" "enable_firestore" {
    project = google_project.pj-oil-dev.project_id
    service = "firestore.googleapis.com"
    disable_dependent_services = true
}