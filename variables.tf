variable "environment" {
  description = "Environment name which will be used as resource's prefix"
  type        = string
}

variable "project" {
  type = string
}

variable "region" {
  type = string
}


variable "cloud_run_intro_enabled" {
  description = "Controls if Intro cloud run should be created"
  type        = bool
  default     = false
}
