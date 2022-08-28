# Deploying Static Website On AWS Using Terraform And Ansible
Reference Source : https://medium.com/@mitesh_shamra/deploying-website-on-aws-using-terraform-and-ansible-f0251ae71f42

# Prerequisites
- Buy new or select a domain name
- Install Ansible https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html

# How To Run Terraform
- Update domain name to terraform/variable.tf variables
- Change to terraform directory and execute terraform init/apply
- After execution, terraform generated two artifacts: NS records in the console and pem key file in the folder
- Register NS records into DNS provider admin
- Copy generated keyfile into ansible directory

# How To Run Ansible
- Copy your static website into ansible/files/static_website
- In the inventory file, change this to your EC2 instance public IP (i.e: Elastic IP)
52.220.97.224 ansible_ssh_private_key_file=./notAKey.pem
- Find/Replace all sample domain name to your own domain name in nginx configure files
- Run ansible-playbook playbook.yaml
- Access your website by domain name in web browser http://baolong.homes/





