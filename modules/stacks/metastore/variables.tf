variable "metastore_name" {
  type = string
}

variable "metastore_owner" {
  type = string
}

variable "access_connectors" {
  type = map(object({
    id = string
    name = string
    comment = optional(string)
  }))
}


