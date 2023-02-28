variable "region" {
  type        = string
  description = "AWS region to deploy in"
}

variable "domain_name" {
  type        = string
  description = "Name of the domain"
}

variable "master_user" {
  type        = string
  description = "Main user's username, which is stored in the Amazon Elasticsearch Service domain's internal database"
}

variable "master_password" {
  type        = string
  description = "Main user's password, which is stored in the Amazon Elasticsearch Service domain's internal database"
}
