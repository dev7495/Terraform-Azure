# Resource Group ---------------------------------------------------
variable "rg-name" {
  type    = string
  default = "CareAccess-TF"
}

variable "location" {
  type    = string
  default = "east us"
}


# SQL Server ---------------------------------------------------
variable "sql-server-name" {
  type    = string
  default = "care-sql-server-tf"
}

variable "Sql-Server-version" {
  type    = string
  default = "12.0"
}


variable "sql-server-admin-name" {
  type    = string
  default = "Test"
}

variable "sql-server-admin-password" {
  type    = string
  default = "Complex@12345"
}

variable "minimum_tls_version" {
  type    = number
  default = 1.2
}

variable "azuread_administrator" {
  type    = string
  default = "L1 - Intern & Trainee"
}

variable "azuread_administrator-object_id" {
  type    = string
  default = "dd9f5182-0ed6-4f01-b167-67022b689f69"
}


# SQL Database ---------------------------------------------------
variable "SQL-DB-Name" {
  type    = string
  default = "care-sql-Database-tf"
}

variable "collation" {
  type    = string
  default = "SQL_Latin1_General_CP1_CI_AS"
}


variable "license_type_included" {
  type    = string
  default = "LicenseIncluded"
}

variable "db-max-size" {
  type    = number
  default = 4
}


# Firewall ---------------------------------------------------
variable "Firewall-name" {
  type = string
  default = "Test-User-L1-New"
}


variable "start_ip_address" {
  type = string
  default = "110.227.200.253"
}


variable "end_ip_address" {
  type = string
  default = "110.227.200.253"
}