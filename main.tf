resource "google_redis_instance" "cache" {
  # name           = "ha-memory-cache"
  # tier           = "STANDARD_HA"
  # memory_size_gb = 1

  # location_id             = "us-central1-a"
  # alternative_location_id = "us-central1-f"

  # # authorized_network = "${google_compute_network.auto-network.self_link}"

  # redis_version     = "REDIS_3_2"
  # display_name      = "Terraform Test Instance"
  # reserved_ip_range = "192.168.0.0/29"



  project        = "${var.project}"
  name           = "${var.name}"
  tier           = "${var.tier}"
  memory_size_gb = "${var.memory_size_gb}"

  region                  = "${var.region}"
  location_id             = "${var.location_id}"
  alternative_location_id = "${var.alternative_location_id}"

  authorized_network = "${var.authorized_network}"

  redis_version     = "${var.redis_version}"
  display_name      = "${var.display_name}"
  reserved_ip_range = "${var.reserved_ip_range}"

  labels {
    environment = "${var.environment}"
  }

  depends_on = ["google_project_service.redis"] }


# resource "google_project_services" "services" {
#   # count = "${var.enable_apis ? 1 : 0}"

#   project = "${var.project}"
#   services = ["cloudresourcemanager.googleapis.com"]
# }

resource "google_project_service" "redis" {
  count = "${var.enable_apis ? 1 : 0}"

  project = "${var.project}"
  service = "redis.googleapis.com"
}