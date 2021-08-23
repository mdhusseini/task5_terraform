# Task 5 IaaC

This project assumes the following

 1. You are using ubuntu machine  	
 2.  You have the following packages installed
	 - git
	 - terraform
	 - aws cli
	 - ssh 	
 3. you have aws credentials configured

## Instructions to execute the terraform script
Please execute the following steps to access the programs

 1. login to your ubuntu machine
 2. clone this repository
 3. navigate to the directory
 4. Initialize terraform
	`terraform init`
 5. Apply terraform configuration
    `terraform apply`
 6. when prompted to enter a value, press "Enter"`

## Rationale
This is a simple provisioning of aws resources. The files are split into the main configuration file and a separate iam file defining the policy documents.

## De-provisioning programs
 	`terraform destroy`