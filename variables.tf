variable "region" {
  description = "AWS region"
  type        = string
  default     = "us-east-2"
}

variable "vpc_id" {
  description = "VPC ID for the EKS cluster"
  type        = string
  default     = "vpc-0e1ce630f1b244174" # Replace with your actual VPC ID
}

variable "subnet_ids" {
  description = "List of subnet IDs for the RDS instance"
  type        = list(string)
}

variable "db_username" {
  type        = string
  default     = "admin"
  description = "Database username"
}

variable "db_password" {
  type        = string
  default     = "Password123!" # In production, use Secrets Manager or similar
  description = "Database password"
}

variable "eks_cluster_security_group_id" {
  description = "The ID of the EKS cluster security group to allow access from"
  type        = string
}

variable "eks_public_subnet_ids" {
  description = "List of public subnet IDs from the EKS module for RDS subnet group"
  type        = list(string)
}
