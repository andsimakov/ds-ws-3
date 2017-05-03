Production with Docker (lite)
-----------------------------

## 1. Clone project https://github.com/andsimakov/ds-ws-3
```bash
$ git clone git@github.com:andsimakov/ds-ws-3.git
```
# Terraform

## 2. Create terraform structure

**Video:**  `cookiecutter-terraform.mp4`

```bash
$ cd cookiecutter
$ docker-compose run --rm cookiecutter cookiecutter/terraform
```

## 2.1 Change permission
```bash
# cd ..
# chown `whoami`:`whoami` terraform/ -R
```

## 3. Update file secret.tfvars

`terraform/secret.tfvars`
```
digitalocean_token = "you digitalocean token"
mailgun_api_key = "you mailgun api key"
mailgn_smtp_password = "mailgn smtp password"
```

## 3. Show Terraform plan
```bash
$ cd terraform
$ docker-compose run --rm terraform plan -var-file="secret.tfvars"
```

## 4. Apply Terraform plan

**Video:**  `apply-terraform.mp4`

```bash
$ docker-compose run --rm terraform apply -var-file="secret.tfvars"
```

# Check Mailgun


# Ansible

## 5. Install Ansible roles

**Video:**  `install-roles-ansible.mp4`

```bash
$ cd ansible
$ docker-compose run --rm ansible ansible-galaxy install -p roles -r requirements.yml
```

## 6. Add email for letsencrypt

`ansible/group_vars/all.yml`
```
letsencrypt_admin_email
```

## 6. Run Ansible playbooks

**Video:**  `run-ansible.mp4`

```bash
$ docker-compose run --rm ansible ansible-playbook all.yml -i inventory
```

# Django channels

# 7. Run chat
```bash
$ cd docker
$ docker-compose up
```

# 8. Go to chat
[chat](http://127.0.0.1/)

# Jenkins

## 9. Start Jenkins

**Video:**  `start-jenkins.mp4`

## 10. Configure Jenkins (with username and root)

**Video:**  `configure-jenkins.mp4`

## 11. Create job



## 500. Destroy Terraform plan
```bash
$ docker-compose run --rm terraform destroy -var-file="secret.tfvars"
```
