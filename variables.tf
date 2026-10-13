variable "prefix" {
  description = "Short name used in every resource name. Lowercase letters and numbers only."
  type        = string
  default     = "azstarter"

  validation {
    condition     = can(regex("^[a-z0-9]{3,12}$", var.prefix))
    error_message = "prefix must be 3-12 lowercase letters or numbers (it's used in the storage account name)."
  }
}

variable "location" {
  description = "Azure region to deploy into."
  type        = string
  default     = "australiaeast"
}

variable "vm_size" {
  description = "VM size. Standard_B1s is covered by the Azure free account (750 hrs/month for 12 months)."
  type        = string
  default     = "Standard_B1s"
}

variable "admin_username" {
  description = "Username for SSH login to the VM."
  type        = string
  default     = "azureuser"
}

variable "ssh_public_key_path" {
  description = "Path to your SSH public key."
  type        = string
  default     = "~/.ssh/id_rsa.pub"
}

variable "allowed_ssh_cidr" {
  description = "Your public IP in CIDR form (e.g. 203.0.113.10/32). Only this address can SSH in."
  type        = string
}

variable "tags" {
  description = "Tags added to every resource."
  type        = map(string)
  default = {
    project = "azure-terraform-starter"
    owner   = "abhinand"
    env     = "dev"
  }
}
