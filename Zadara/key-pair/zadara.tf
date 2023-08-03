provider "aws" {
	
	access_key = var.access_key
	secret_key = var.secret_key
	
	endpoints {
		ec2 = "https://compute-lc-us-east-04.zadara.com/api/v2/ec2"        
	} 

	insecure = "true"    
	skip_metadata_api_check = true    
	skip_credentials_validation = true    
	skip_requesting_account_id = true    
	region = "us-east-1"

}

resource "aws_key_pair" "deployer" {
	key_name   = "deployer-key"
	public_key = file("~/.ssh/id_zadara_zc.pub")
}
