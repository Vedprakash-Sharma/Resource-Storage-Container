terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "3.111.0"
    }
  }
 backend "azurerm" {
    resource_group_name  = "hfcl"  
    storage_account_name = "storagehfcl"                      
    container_name       = "hfcl01"                      
    key                  = "hfcl_backup_file.tfstate"        
  }

}

provider "azurerm" {
  features {

  }
}