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

#For Task 2 and 3
#resource "google_service_account" "app" {
#  for_each     = var.service_accounts
#  account_id   = each.value.account_id
#  display_name = each.value.display_name
#  project      = var.project_id
#}

#For Task 2
#resource "google_project_iam_binding" "app_binding" {
#  for_each = ...
#
#  project = var.project_id
#  role    = ....
#  members = [for sa in google_service_account.app : "......"]
#}

#For Task 3
#resource "google_project_iam_member" "app_member" {
#  for_each = ...
#
#  project = var.project_id
#  role = ....
#  member = "serviceAccount:...."
#}
