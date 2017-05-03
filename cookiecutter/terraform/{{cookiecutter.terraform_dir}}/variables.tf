variable "base_domain" { default = "{{ cookiecutter.base_domain }}" }

variable "production_domain" { default = "{{ cookiecutter.production_domain }}" }
variable "staging_domain" { default = "{{ cookiecutter.staging_domain }}" }
variable "development_domain" { default = "{{ cookiecutter.development_domain }}" }

variable "jenkins_domain" { default = "{{ cookiecutter.jenkins_domain }}" }

variable "registry_domain" { default = "{{ cookiecutter.registry_domain }}" }

variable "digitalocean_region" { default = "{{ cookiecutter.digitalocean_region }}" }
variable "digitalocean_image" { default = "{{ cookiecutter.digitalocean_image }}" }
