variable "project" {
  default = "unknown"
  type    = string
}

variable "app_name" {
  default = "unknown"
  type    = string
}

variable "credential" {
  default     = "unknown.json"
  description = "compute engine credential"
  type        = string
}

variable "tpl_file" {
  description = "bash script executed at startup"
  default     = "unknown.tpl"
  type        = string
}
