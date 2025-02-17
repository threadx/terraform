# Sensitive data
# export TF_VAR_name='value'

variable "access_key" {
  type	= string
  description = "This is your access key"
}

variable "secret_key" {
  type	= string
  description	= "This is your secret key"
}

variable "key_name" {
  type = string
  description = "This is the name of the ssh key used for VMs"
  default = "deployer-key"
}

variable "instance_type" {
  type = string
  default = "t3.small"
}

variable "subnet_id" {
  type = string
  default = "subnet-470b7b4fc69747abb9295137afcbd059"
}
