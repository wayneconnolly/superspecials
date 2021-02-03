variable "app_name" {
  type = string
  default = "superspecials"
}

variable "location" {
  type = string
  default = "Australia Southeast"
}

variable "environment" {
  type = string
  default = "prod"
}

locals {
  storage_account_name = "st${var.app_name}${var.environment}"
}