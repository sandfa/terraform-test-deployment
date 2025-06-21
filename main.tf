terraform {
  backend "azurerm" {
    resource_group_name  = "lowcloud-terraform-storage"
    storage_account_name = "lowcloudterraformstorage"
    container_name       = "test-deploy-tfstate"
    key                  = "terraform.tfstate"
  }
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "~> 4.1.0"
    }
  }
}

provider "azurerm" {
  features {
    resource_group {
      prevent_deletion_if_contains_resources = false
    }
  }
  subscription_id = var.subscription_id
}

resource "azurerm_resource_group" "group" {
  name     = "resource-group-lowcloud"
  location = "westeurope"
}