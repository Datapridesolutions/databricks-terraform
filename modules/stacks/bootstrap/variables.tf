variable "environments" {
  type = map(object({
    name = string
    code = string
  }))
  validation {
    condition = alltrue([
      for env in values(var.environments) : length(env.code) >= 3 && length(env.code) <= 4
    ])
    error_message = "All environment codes must be between 3 and 4 characters."
  }
  validation {
    condition = alltrue([
      for env in values(var.environments) : can(regex("^[a-z]+$", env.code))
    ])
    error_message = "All environment codes must contain only lowercase letters."
  }
}

variable "data_subscription_id" {
  type = string
}