provider "google" {
  credentials = "${file("account.json")}"
  project     = "my-project-id"
  region      = "eu-west1-c"
}