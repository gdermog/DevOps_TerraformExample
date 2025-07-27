
variable "public_key" {
  description = "Veřejný SSH klíč"
  type        = string
  default     = ""
}

variable "name_prefix" {
  description = "Prefix pro pojmenování zdrojů"
  type        = string
  default     = "terraform-homework"
}

variable "environment" {
  description = "Prostředí pro tagy"
  type        = string
  default     = "dev-module"
}

variable "course_name" {
  description = "Název kurzu pro tagy"
  type        = string
  default     = "DevOps-Terraform"
}