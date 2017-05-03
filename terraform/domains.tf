# Create base domain
resource "digitalocean_domain" "default" {
  name       = "${var.base_domain}"
  ip_address = "${digitalocean_droplet.production.ipv4_address}"
}

# Add a record to mailgun_sending_record_spf1 domain
resource "digitalocean_record" "mailgun_sending_record_spf1" {
  domain = "${digitalocean_domain.default.name}"
  type   = "${mailgun_domain.default.sending_records.0.record_type}"
  name   = "@"
  value  = "${mailgun_domain.default.sending_records.0.value}"
}

# Add a record to mailgun_sending_record_rsa domain
resource "digitalocean_record" "mailgun_sending_record_rsa" {
  domain = "${digitalocean_domain.default.name}"
  type   = "${mailgun_domain.default.sending_records.1.record_type}"
  name   = "${replace(mailgun_domain.default.sending_records.1.name, "/.${digitalocean_domain.default.name}$/", "")}"
  value  = "${mailgun_domain.default.sending_records.1.value}"
}

# Add a record to staging domain
resource "digitalocean_record" "staging" {
  domain = "${digitalocean_domain.default.name}"
  type   = "A"
  name   = "${replace(var.staging_domain, "/.${digitalocean_domain.default.name}$/", "")}"
  value  = "${digitalocean_droplet.staging.ipv4_address}"
}

# Add a record to development domain
resource "digitalocean_record" "dev" {
  domain = "${digitalocean_domain.default.name}"
  type   = "A"
  name   = "${replace(var.development_domain, "/.${digitalocean_domain.default.name}$/", "")}"
  value  = "${digitalocean_droplet.dev.ipv4_address}"
}

# Add a record to jenkins domain
resource "digitalocean_record" "jenkins" {
  domain = "${digitalocean_domain.default.name}"
  type   = "A"
  name   = "${replace(var.jenkins_domain, "/.${digitalocean_domain.default.name}$/", "")}"
  value  = "${digitalocean_droplet.jenkins.ipv4_address}"
}

# Add a record to registry domain
resource "digitalocean_record" "registry" {
  domain = "${digitalocean_domain.default.name}"
  type   = "A"
  name   = "${replace(var.registry_domain, "/.${digitalocean_domain.default.name}$/", "")}"
  value  = "${digitalocean_droplet.registry.ipv4_address}"
}
