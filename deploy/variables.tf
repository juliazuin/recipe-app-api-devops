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

variable "ecr_image_api" {
  description = "ECR image for API"
  default     = "250953485096.dkr.ecr.sa-east-1.amazonaws.com/recipe-app-api-devops:lastest"
}

variable "ecr_image_proxy" {
  description = "ECR image for proxy"
  default     = "250953485096.dkr.ecr.sa-east-1.amazonaws.com/recipe-app-api-proxy:latest"
}

variable "django_secret_key" {
  description = "Secret key for django app"
}
