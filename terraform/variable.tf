variable "location" {
  description = "Regiao do Azure"
  type        = string
  default     = "centralus"
}

variable "resource_group_name" {
  description = "Nome do Resource Group"
  type        = string
  default     = "projeto-final-rg"
}

variable "vm_size" {
  description = "Tamanho da VM"
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Usuario admin da VM"
  type        = string
  default     = "adminuser"
}