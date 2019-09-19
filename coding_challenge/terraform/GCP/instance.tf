resource "google_compute_instance" "dnsserver" {
  name         = "dnsmasq"
  machine_type = "n1-standard-1"
  zone         = "eu-west1-c"

  tags = ["foo", "bar"]

  boot_disk {
    initialize_params {
      image = "debian-cloud/debian-9"
    }
  }

  // Local SSD disk
  scratch_disk {
  }

  network_interface {
    network = "default"

    access_config {
      // Ephemeral IP
    }
  }

  metadata = {
    foo = "bar"
  }

  metadata_startup_script = "file(../scripts/startup-script.sh)"

  service_account {
    scopes = ["userinfo-email", "compute-ro", "storage-ro"]
  }
}