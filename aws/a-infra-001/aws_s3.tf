module "s3" {
  source = "./modules/s3"

  bucket_name                   = var.s3_bucket_name
  force_destroy                 = var.s3_force_destroy
  versioning_enabled            = var.s3_versioning_enabled
  storage_class                 = var.s3_storage_class
  storage_class_transition_days = var.s3_storage_class_transition_days
  encryption_algorithm          = var.s3_encryption_algorithm
  block_public_acls             = var.s3_block_public_acls
  block_public_policy           = var.s3_block_public_policy
  ignore_public_acls            = var.s3_ignore_public_acls
  restrict_public_buckets       = var.s3_restrict_public_buckets
  tags                          = var.s3_tags
}
