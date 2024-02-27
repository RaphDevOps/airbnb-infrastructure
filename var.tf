variable "AMI_ID" {
  description = "require ec2 ami"
  type        = string
  default     = "ami-07761f3ae34c4478d"
}

variable "INSTANCE_TYPE" {
  description = "require instance type"
  type        = string
  default     = "t2.micro"
}