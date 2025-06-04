terraform {
  backend "azurerm" {
    resource_group_name  = "Test_resource_group"
    storage_account_name = "mytfstateaccount999"
    container_name       = "dev-tfstate-blob"
    key                  = "terraform.tfstate"
  }
}
