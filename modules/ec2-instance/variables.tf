
variable "mod_public_key" {
  description = "Veřejný SSH klíč"
  type        = string
  default     = ""
}

variable "mod_name_prefix" {
  description = "Prefix pro pojmenování zdrojů"
  type        = string
  default     = "terraform-homework"
}

variable "mod_environment" {
  description = "Prostředí pro tagy"
  type        = string
  default     = "dev"
}

variable "mod_course_name" {
  description = "Název kurzu pro tagy"
  type        = string
  default     = "DevOps-Terraform"
}

variable "mod_user_data" {
  description = "User data script pro EC2 instanci"
  type        = string
  default     = ""
}

variable "mod_additional_tags" {
  description = "Další tagy pro EC2 instanci"
  type        = map(string)
  default     = {}
}