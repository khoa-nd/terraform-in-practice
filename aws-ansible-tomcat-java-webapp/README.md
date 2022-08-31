# Deploying Java WebApp with Tomcat server On AWS Using Terraform And Ansible

# Prerequisites
- Install Ansible https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

# How To Run Terraform
- Update domain name to terraform/variable.tf variables
- Change to terraform directory and execute terraform init/apply
- After execution, terraform generated two artifacts: NS records in the console and pem key file in the folder
- Register NS records into DNS provider admin
- Copy generated keyfile into ansible directory

# How To Run Ansible
- In the inventory file, change this to your EC2 instance public IP (i.e: Elastic IP)
52.220.X.X ansible_ssh_private_key_file=./notAKey.pem
- Run ansible-playbook playbook.yaml
- Access your website by domain name in web browser http://52.220.X.X:8080/travel.html

# TODO
- Install Nginx
- Forward request from Nginx to Tomcat



