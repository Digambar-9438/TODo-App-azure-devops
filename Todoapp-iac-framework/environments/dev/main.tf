module "resource_group" {
  source = "../../modules/azurerm_resource_group"
  rgs    = var.rgs
}

module "network" {
  depends_on = [ module.resource_group ]
  source   = "../../modules/azurerm_networking"
  networks = var.networks
}

module "public_ip" {
  depends_on = [ module.resource_group ]
  source     = "../../modules/azurerm_public_ip"
  public_ips = var.public_ips
}

module "key_vault" {
  depends_on = [ module.resource_group ]
  source     = "../../modules/azurerm_key_vault"
  key_vaults = var.key_vaults
}

module "sql_server" {
  depends_on = [ module.resource_group ]
  source          = "../../modules/azurerm_sql_server"
  sql_server_name = "sql-dev-todoapp-nayak123"
  rg_name         = "rg-nayak-dev-todoapp01"
  location        = "centralindia"
  admin_username  = "superadmin"
  admin_password  = "Password@123"
  tags            = {}
}

module "sql_db" {
  depends_on  = [module.sql_server]
  source      = "../../modules/azurerm_sql_database"
  sql_db_name = "sqlnayakdb-dev-todoapp"
  server_id   = module.sql_server.server_id
  max_size_gb = "2"
  tags        = {}
}

#  module "key_vaults" {
#   depends_on = [module.resource_group]
#   source     = "../../modules/azurerm_key_vault"
#   key_vaults = var.key_vaults
# }

module "azuer_virtuacl_machsine1"{
  depends_on = [ module.network,module.public_ip,module.resource_group ]
  source = "../../modules/azurerm_compute"
  vms=var.vms
}