resource "azurerm_resource_group" "hfcl" {
  name     = "hfcl"
  location = "West Europe"
}
resource "azurerm_storage_account" "hfcl01" {
  name                     = "storagehfcl"
  resource_group_name      = azurerm_resource_group.hfcl.name
  location                 = azurerm_resource_group.hfcl.location
  account_tier             = "Standard"
  account_replication_type = "GRS"
  depends_on               = [azurerm_resource_group.hfcl]
}


resource "azurerm_storage_container" "hfcl02" {
  name                  = "hfcl01"
  storage_account_name  = azurerm_storage_account.hfcl01.name
  container_access_type = "private"
  depends_on            = [azurerm_resource_group.hfcl, azurerm_storage_account.hfcl01]
}