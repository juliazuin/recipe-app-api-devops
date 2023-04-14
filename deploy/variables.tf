variable "prefix" {
  # raad = recipe-app-api-devops
  default = "raad"
}

variable "project" {
  default = "recipe-app-api-devops"
}

variable "contact" {
  default = "email@londonappdev.com"
}

variable "db_username" {
  description = "Username for de RDS postgress instance"
}

variable "db_password" {
  description = "Password for the RDS postgrees instance"
}

variable "bastion_key_name" {
  default = "recipe-app-api-devops-bastion"
}
