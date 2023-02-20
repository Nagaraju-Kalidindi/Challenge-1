resource "azurerm_mssql_server" "myprimarysql-server" {
    name = "myprimarysql-server"
    resource_group_name = var.resource_group
    location = var.location
    version = var.primary_database_version
    administrator_login = var.primary_database_admin
    administrator_login_password = var.primary_database_password  
}

resource "azurerm_sql_database" "mydb" {
  name                = "mydb"
  resource_group_name = var.resource_group
  location            = var.location
  server_name         = azurerm_mssql_server.myprimarysql-server.name

  depends_on = [
    azurerm_mssql_server.myprimarysql-server
  ]

}

