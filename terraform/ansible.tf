data "template_file" "inventory" {
  template = "${file("${path.module}/inventory.tpl")}"

  vars {
    production_ip = "${digitalocean_droplet.production.ipv4_address}"
    staging_ip = "${digitalocean_droplet.staging.ipv4_address}"
    dev_ip = "${digitalocean_droplet.dev.ipv4_address}"
    jenkins_ip = "${digitalocean_droplet.jenkins.ipv4_address}"
    registry_ip = "${digitalocean_droplet.registry.ipv4_address}"
  }
}

resource "local_file" "ansible" {
    content     = "${data.template_file.inventory.rendered}"
    filename = "${path.module}/../ansible/inventory"
}

data "template_file" "production" {
  template = "${file("${path.module}/host_vars.tpl")}"

  vars {
    domain = "${var.production_domain}"
  }
}
resource "local_file" "production" {
    content     = "${data.template_file.production.rendered}"
    filename = "${path.module}/../ansible/host_vars/production"
}



data "template_file" "staging" {
  template = "${file("${path.module}/host_vars.tpl")}"

  vars {
    domain = "${var.staging_domain}"
  }
}
resource "local_file" "staging" {
    content     = "${data.template_file.staging.rendered}"
    filename = "${path.module}/../ansible/host_vars/staging"
}


data "template_file" "development" {
  template = "${file("${path.module}/host_vars.tpl")}"

  vars {
    domain = "${var.development_domain}"
  }
}
resource "local_file" "development" {
    content     = "${data.template_file.development.rendered}"
    filename = "${path.module}/../ansible/host_vars/development"
}


data "template_file" "jenkins" {
  template = "${file("${path.module}/host_vars.tpl")}"

  vars {
    domain = "${var.jenkins_domain}"
  }
}
resource "local_file" "jenkins" {
    content     = "${data.template_file.jenkins.rendered}"
    filename = "${path.module}/../ansible/host_vars/jenkins"
}

data "template_file" "registry" {
  template = "${file("${path.module}/host_vars.tpl")}"

  vars {
    domain = "${var.registry_domain}"
  }
}
resource "local_file" "registry" {
    content     = "${data.template_file.registry.rendered}"
    filename = "${path.module}/../ansible/host_vars/registry"
}
