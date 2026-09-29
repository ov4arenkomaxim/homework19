variable "region" {
  type        = string
  default     = "eu-central-1"
}

variable "project_name" {
  type        = string
  default     = "vpc-lab"
}

variable "vpc_cidr" {
  type        = string
  default     = "10.0.0.0/16"
}

variable "public_subnet_cidr" {
  type        = string
  default     = "10.0.1.0/24"
}

variable "private_subnet_cidr" {
  type        = string
  default     = "10.0.2.0/24"
}

variable "instance_type" {
  type        = string
  default     = "t3.micro"
}

variable "my_ip" {
  type        = string
}
