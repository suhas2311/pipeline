
module "s3_backend_create" {
    source = "./modules/s3_bucket"
    bucket_name = "s4-backend-bucket-985687654867"
}

module "dynamodb_locking_create" {
   source = "./modules/dynamo_db"
   dynamo_name = "my_dynamo_locking_table"
   hash_key = "LockID"
   bill_mode = "PAY_PER_REQUEST"
}