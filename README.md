# Challenge-1
A 3-tier environment is a common setup. Use a tool of your choosing/familiarity create these resources on a cloud environment Azure.

Pre requisite: 
1. A service principle should be created with contributor access to the current azure subcirption for terraform to authenticate Azure portal. 
2. A Storage account and a container under storage account should be created for Terraform state file to storing. We are using this storage account for our Terraform backend.  I have included a terraform script for storage account createion.

Architecture design:

1. 3 Linux Virtual machines named Web server, Application server, Database server associated with 3 subnets in a single vnet.
2. Web VM should allow traffic from Internet. 
3. Application server shoule allow traffic from web server and reply to it 
4. Application server can connect to Database server and vice versa but, Database server should not have any direct access to/from Web server VM.

Steps to Test the script:

1. terraform init
2. terraform validate
3. terraform plan
4. terraform apply

To Destroy resources:

  terraform destroy
  
Note: We can store the sensitive data like certificates, credentials on Azure KeyVault and retrrieve them when ever needed by using a data source in terraform script. For this secrets need to be stored on azure key vault already before access via terraform script.  
