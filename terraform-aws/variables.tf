variable "aws_region" {
  description = "AWS region for deployment"
  type        = string
  default     = "us-east-2"
}

variable "project_name" {
  description = "Project name used as a prefix for AWS resources"
  type        = string
  default     = "devsu-demo-nodejs"
}

variable "instance_type" {
  description = "EC2 instance type"
  type        = string
  default     = "t3.micro"
}

variable "image_name" {
  description = "Container image name (e.g. jml0405/devsu-demo-nodejs)"
  type        = string
  default     = "jml0405/devsu-demo-nodejs"
}

variable "image_tag" {
  description = "Container image tag to deploy"
  type        = string
  default     = "latest"
}

variable "app_port" {
  description = "Application port inside the container"
  type        = number
  default     = 8000
}

variable "public_port" {
  description = "Public port exposed by EC2"
  type        = number
  default     = 80
}

variable "allowed_cidrs" {
  description = "CIDR blocks allowed to access the public application port"
  type        = list(string)
  default     = ["0.0.0.0/0"]
}

variable "vpc_cidr" {
  description = "CIDR block for the VPC"
  type        = string
  default     = "10.42.0.0/16"
}

variable "public_subnet_cidr" {
  description = "CIDR block for the public subnet"
  type        = string
  default     = "10.42.1.0/24"
}
