variable "environment" {
  type = object({
    name = string
    code = string
  })
  validation {
    condition     = length(var.environment.code) >= 3 && length(var.environment.code) <= 4
    error_message = "Environment code must be between 3 and 4 characters."
  }
  validation {
    condition     = can(regex("^[a-z]+$", var.environment.code))
    error_message = "Environment code must contain only lowercase letters."
  }
}

variable "region" {
  type = object({
    code = string
    location = string
  })
}

variable "network_settings" {
  type = object({
    virtual_network_address_range = string
    private_subnet_address_range = string
    public_subnet_address_range = string
    pep_subnet_address_range = string
  })
}
