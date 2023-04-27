variable "url" {
  type        = string
  default     = "https://cloud.ametnes.com/api/c/v1"
  description = "The Ametnes Cloud endpoint to send your API requests to"
}

variable "token" {
  type        = string
  description = "The Ametnes cloud API token to use. You'd need to create one in the Ametnes Cloud console corresponding to your regsitered email"
  sensitive   = true
}

variable "username" {
  type        = string
  description = "This is your Ametnes cloud registered email address"
}

variable "project" {
  type        = string
  description = "The project you'd like to create your resources in"
}

variable "aws_location" {
  type = object({
    name = string
    code = string
  })
  description = "The name and code of the location where your resources will be provisioned (AWS)"
}

variable "gcp_location" {
  type = object({
    name = string
    code = string
  })
  description = "The name and code of the location where your resources will be provisioned (GCP)"
}

variable "insecure" {
  type    = bool
  default = false
}

variable "admin_user" {
  type = object({
    name     = string
    password = string
  })
  description = "Credentials to use for the Admin user"
  sensitive   = true
}

variable "cluster_user" {
  type = object({
    name     = string
    password = string
  })
  description = "Credentials to use for the Clustering user"
  sensitive   = true
}
