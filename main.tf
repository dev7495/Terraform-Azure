
# Creates resource Group -------------------------------------------------------------------
resource "azurerm_resource_group" "CareAccess-TF" {
  name     = var.rg-name
  location = var.location
}


# Creates SQL Server -------------------------------------------------------------------
resource "azurerm_mssql_server" "Care-Sql-Server-TF" {
  name                         = var.sql-server-name
  resource_group_name          = azurerm_resource_group.CareAccess-TF.name
  location                     = azurerm_resource_group.CareAccess-TF.location
  version                      = var.Sql-Server-version
  administrator_login          = var.sql-server-admin-name
  administrator_login_password = var.sql-server-admin-password
  minimum_tls_version          = var.minimum_tls_version

  azuread_administrator {
    login_username = var.azuread_administrator
    object_id      = var.azuread_administrator-object_id
  }
}


# Creates SQL Database -------------------------------------------------------------------
resource "azurerm_mssql_database" "Care-Sql-DB-TF" {
  name      = var.SQL-DB-Name
  server_id = azurerm_mssql_server.Care-Sql-Server-TF.id
  # collation      = var.collation
  license_type = var.license_type_included
  # max_size_gb    = var.db-max-size
  # read_scale     = true
  # sku_name       = "S0"
  zone_redundant = false
  #  enclave_type   = "VBS"
}


# Creates Firewall Rule to allow access to Server -----------------------------------------------
resource "azurerm_sql_firewall_rule" "Firewall1" {
  name                = var.Firewall-name
  resource_group_name = azurerm_resource_group.CareAccess-TF.name
  server_name         = azurerm_mssql_server.Care-Sql-Server-TF.name
  start_ip_address    = var.start_ip_address
  end_ip_address      = var.end_ip_address
}




# END --------------------------------------------------------------------------------------------