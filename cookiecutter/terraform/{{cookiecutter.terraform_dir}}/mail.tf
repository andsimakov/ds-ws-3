variable "mailgun_api_key" {}
variable "mailgn_smtp_password" {}

# Configure the Mailgun provider
provider "mailgun" {
  api_key = "${var.mailgun_api_key}"
}

# Create a new Mailgun domain
resource "mailgun_domain" "default" {
  name          = "${var.base_domain}"
  spam_action   = "disabled"
  smtp_password = "${var.mailgun_api_key}"
}
