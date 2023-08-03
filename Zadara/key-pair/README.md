# Terraform Files for Uploading a key-pair to zCompute

## Variables

It is recommended that access_key and secret_key variables should be entered via the command line or by using Hashivault

export TF_VAR_access_key='1asdfasdfasdfasdf'
export TF_VAR_secret_key='7aa4e83a59065462c'

## Generating the local ssh key-pair id_zadara_zc

The aws_key_pair resource in zadara.tf for the public key pulls the from ~/.ssh/id_zadara_zc.pub  You can change the name of the key as needed.

Use:

ssh-keygen -b 4096

to generate the key. Specify id_zadara_zc or the name of the key you wish to generate.  Make appropriate changes to the aws_key_pair resource.

## Terraform Commands

terraform init

* This brings in the aws provider (Zadara zCompute uses this provider)

terraform plan

* Gives you an idea of what will change

terraform apply

* This will upload your key

terraform destroy

* This will remove your key
