resource "google_redis_instance" "cache" {
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

  depends_on = ["google_project_service.redis"] 
}

resource "google_project_service" "redis" {
  count = "${var.enable_apis ? 1 : 0}"

  project = "${var.project}"
  service = "redis.googleapis.com"
}