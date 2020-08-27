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
