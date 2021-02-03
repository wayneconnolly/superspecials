variable "location" {
  type        = string
  description = "Azure Region Location"
  default = "Australia Southeast"
}

variable "resource_group" {
  type        = string
  description = "Resource Group Name"
  default = "superspecialstf"
}

variable "storage_account" {
  type        = string
  description = "Storage Account Name"
  default = "site"
}