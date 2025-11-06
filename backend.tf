terraform {
  backend "azurerm" {
    resource_group_name  = "poc"
    storage_account_name = "poctfstatemcp"  # Create this manually first
    container_name       = "poctfstate"
    key                  = "mlops-mcp.terraform.tfstate"
  }
}

# Workspaces: Select with `terraform workspace select dev` or `stage`
# Init will prompt to create if missing.