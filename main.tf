resource "google_cloud_run_service" "intro" {
  count = var.cloud_run_intro_enabled ? 1 : 0

  location = var.region
  name     = "${var.environment}-intro"
  template {
    spec {
      containers {
        image = "gcr.io/cloudrun/hello"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }

  metadata {
    annotations = {
      "run.googleapis.com/ingress"     = "all"
      "run.googleapis.com/client-name" = "terraform"
    }
  }

}

resource "google_service_account" "intro" {
  count = var.cloud_run_intro_enabled ? 1 : 0

  account_id   = "${var.environment}-cloud-run-intro"
  display_name = "A service account that only is used by cloud run intro"
}

resource "google_cloud_run_service_iam_binding" "intro_invoker" {
  count = var.cloud_run_intro_enabled ? 1 : 0

  location = google_cloud_run_service.intro[0].location
  service  = google_cloud_run_service.intro[0].name
  role     = "roles/run.invoker"
  members  = ["serviceAccount:${google_service_account.intro[0].email}"]
}

resource "google_cloud_run_service_iam_binding" "intro_viewer" {
  count = var.cloud_run_intro_enabled ? 1 : 0

  location = google_cloud_run_service.intro[0].location
  service  = google_cloud_run_service.intro[0].name
  role     = "roles/run.viewer"
  members  = ["serviceAccount:${google_service_account.intro[0].email}"]
}
