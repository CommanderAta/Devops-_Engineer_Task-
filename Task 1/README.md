
# Web Application Infrastructure Setup

This project demonstrates setting up a basic web application infrastructure on AWS using Infrastructure as Code (IaC) tools. The infrastructure includes a VPC, public and private subnets, an Internet Gateway, a public-facing Load Balancer, an EC2 instance running Nginx, and an RDS instance running MySQL. The EC2 instance is configured using Ansible.

## Requirements

### Provisioning Infrastructure

- Use Terraform to create the infrastructure.
- The infrastructure includes:
  - A VPC with public and private subnets across two availability zones.
  - An Internet Gateway and corresponding route tables for internet access in the public subnet.
  - A public-facing Load Balancer.
  - An EC2 instance (in the public subnet) running a simple web server (e.g., Nginx).
  - An RDS instance (in the private subnet) running MySQL.

### Configuration Management

- Use Ansible to configure the EC2 instance.
- The Ansible playbook will:
  - Install Nginx on the EC2 instance.
  - Deploy a simple HTML page that says "Hello, World!".
  - Configure Nginx to serve the HTML page.

### Networking and Security

- Security groups are set up to allow:
  - HTTP and HTTPS traffic to the Load Balancer.
  - SSH access to the EC2 instance from a specific IP (your IP).
  - MySQL access to the RDS instance only from the EC2 instance.

## Setup Instructions

### Terraform

1. **Install Terraform**: Follow the instructions from the official [Terraform website](https://www.terraform.io/downloads.html) to install Terraform.
2. **Initialize Terraform**: Run `terraform init` in the directory containing your Terraform scripts.
3. **Configure Variables**: Update the `terraform.tfvars` file with your specific values (e.g., `vpc_cidr`, `subnets`, `instance_type`, etc.).
4. **Plan and Apply**:
    ```bash
    terraform plan -var-file=../config/terraform.tfvars
    terraform apply -var-file=../config/terraform.tfvars
    ```
5. **Verify Infrastructure**: Use the AWS Management Console to verify the resources created.

### Ansible

1. **Install Ansible**: Follow the instructions from the official [Ansible website](https://docs.ansible.com/ansible/latest/installation_guide/intro_installation.html) to install Ansible.
2. **Configure Inventory**: Update the Ansible inventory file with the public IP of your EC2 instance.
3. **Run Ansible Playbook**:
    ```bash
    ansible-playbook -i inventory playbook.yml
    ```
4. **Verify Configuration**: Access the EC2 instance's public IP in your browser to see the "Hello, World!" page.

## Assumptions

- AWS credentials are configured on your local machine for Terraform and Ansible to use.
- SSH key pair is available and specified in the Terraform configuration for EC2 access.
- Basic knowledge of Terraform and Ansible is assumed.

## Files

- `main.tf`: Main Terraform configuration file.
- `variables.tf`: Terraform variables file.
- `terraform.tfvars`: Terraform variables value file.
- `playbook.yml`: Ansible playbook for configuring the EC2 instance.
- `inventory`: Ansible inventory file.

