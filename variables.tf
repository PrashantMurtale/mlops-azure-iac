variable "location" {
  description = "Azure region"
  default     = "East US"
}

variable "vm_size" {
  description = "VM size (overrides per env)"
  default     = "Standard_B2s"  # Small default; override in tfvars
}
  
