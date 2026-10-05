variable "name" {
  description = "Name of the inline IAM role policy"
  type        = string
}

variable "role" {
  description = "Name of the IAM role receiving the inline policy"
  type        = string
}

variable "policy" {
  description = "IAM policy document"
  type        = any
}