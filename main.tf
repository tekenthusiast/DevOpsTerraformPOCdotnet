provider "azurerm" {

    version = "2.5.0"
    features {
    }
}

terraform {
    backend "azurerm" {
        resource_group_name = "tf_rg_blob"
        storage_account_name = "tfstorageaccountapi"
        container_name = "tfstatefile"
        key = "terraform.tfstate" 
    }
}

variable "imagebuild" {
    type = string
    description = "Latest Image Build"
}

resource "azurerm_resource_group" "tf_test" {
    name = "terraformrg"
    location = "Central US"
  
}

resource "azurerm_container_group" "tfcgone_test" {
    name                        = "weatherapi"
    location                    = azurerm_resource_group.tf_test.location
    resource_group_name         = azurerm_resource_group.tf_test.name

    ip_address_type     = "public"
    dns_name_label      = "binarythivam"
    os_type             = "Linux"

    container {
            name            = "weatherapi"
            image           = "vamsi1122/weatherapi:${var.imagebuild}"
                cpu         = "1"
                memory      = "1"
            ports {
              port          = 80
              protocol      = "TCP"
            }

    }


}