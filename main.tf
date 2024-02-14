provider "google" {
  project = "sea-rd-interview-lab"
}

resource "google_service_account" "appone" {
  account_id   = "appone"
  display_name = "App One Service Account"
  project      = "sea-rd-interview-lab"
}

resource "google_project_iam_binding" "appone_cloudbuild" {
  project = "sea-rd-interview-lab"
  role    = "roles/cloudbuild.serviceAgent"
  members = ["serviceAccount:${google_service_account.appone.email}"]
}

resource "google_project_iam_binding" "appone_cloudfunctions_invoker" {
  project = "sea-rd-interview-lab"
  role    = "roles/cloudfunctions.invoker"
  members = ["serviceAccount:${google_service_account.appone.email}"]
}

resource "google_project_iam_binding" "appone_cloudscheduler_serviceagent" {
  project = "sea-rd-interview-lab"
  role    = "roles/cloudscheduler.serviceAgent"
  members = ["serviceAccount:${google_service_account.appone.email}"]
}

resource "google_project_iam_binding" "appone_storage_admin" {
  project = "sea-rd-interview-lab"
  role    = "roles/storage.admin"
  members = ["serviceAccount:${google_service_account.appone.email}"]
}
