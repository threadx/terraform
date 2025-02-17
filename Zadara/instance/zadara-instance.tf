terraform {
  required_providers {
     aws = {
      # Specifies the source location of the AWS provider plugin
      source  = "hashicorp/aws" 
      # Sets the version constraint for the AWS provider plugin
      # version = "~> 5.4.0" 
    }
  }
}

provider "aws" {
	
	access_key = var.access_key
	secret_key = var.secret_key

	endpoints {

		ec2 = "https://compute-us-east-101.zadara.com/api/v2/ec2"        
	} 

	insecure = "true"    
	skip_metadata_api_check = true    
	skip_credentials_validation = true    
	skip_requesting_account_id = true    
	region = "us-east-1"

}

resource "aws_key_pair" "deployer" {
	key_name   = var.key_name
	public_key = file("~/.ssh/us-east-101.pem")
}

resource "aws_instance" "server1e" {
# ubuntu 20.04
#  ami = "ami-5be68609acc74ce1a720e4e0614664ad"
  ami = "ami-d6c78acc89e24a21ad231bf343440b2c"

## us-west-1  
#  ami = "ami-f8bbd2ad4880400aa6b910ff2b138f85"  
  instance_type = "${var.instance_type}"
  subnet_id = "${var.subnet_id}"  
#  vpc_security_group_ids = [aws_security_group.allow_all.id]  
  key_name = var.key_name
  tags = {  
	Name      = "server-1",  
	CreatedBy = "Terraform"  
	}
  ebs_block_device {
    device_name = "/dev/sda1"
    volume_size = 10
  }
}

