variable "bucket_name" {
  description = "Name of the S3 bucket"
  type        = string
}

variable "force_destroy" {
  description = "Whether to delete all objects when the bucket is destroyed"
  type        = bool
}

variable "versioning_enabled" {
  description = "Whether versioning is enabled for the bucket"
  type        = bool
}

variable "storage_class" {
  description = "S3 storage class for objects after the transition period"
  type        = string
  validation {
    condition = contains([
      "STANDARD",
      "STANDARD_IA",
      "ONEZONE_IA",
      "INTELLIGENT_TIERING",
      "GLACIER_IR",
      "GLACIER",
      "DEEP_ARCHIVE",
    ], var.storage_class)
    error_message = "storage_class must be a supported S3 storage class."
  }
}

variable "storage_class_transition_days" {
  description = "Number of days before objects transition to the selected storage class"
  type        = number
  validation {
    condition     = var.storage_class_transition_days >= 0
    error_message = "storage_class_transition_days must be zero or greater."
  }
}

variable "encryption_algorithm" {
  description = "Server-side encryption algorithm for the bucket"
  type        = string
}

variable "block_public_acls" {
  description = "Whether public ACLs are blocked"
  type        = bool
}

variable "block_public_policy" {
  description = "Whether public bucket policies are blocked"
  type        = bool
}

variable "ignore_public_acls" {
  description = "Whether public ACLs are ignored"
  type        = bool
}

variable "restrict_public_buckets" {
  description = "Whether public bucket policies are restricted"
  type        = bool
}

variable "tags" {
  description = "Additional tags for the bucket"
  type        = map(string)
}
