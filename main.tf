provider "azurerm" {

    version = "2.5.0"
    features {
    }
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
            image           = "vamsi1122/weatherapi:v1"
                cpu         = "1"
                memory      = "1"
            ports {
              port          = 80
              protocol      = "TCP"
            }

    }

  
}