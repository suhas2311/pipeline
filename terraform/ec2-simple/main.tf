
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

module "ec2_create" {
    source = "./modules/ec2_instance"
    ec2_ami = "ami-024c319d5d14b463e"
    ec2_instance_type = "t2.micro"
    ec2_pem = "devops-june-2022"
}

module "file_exec" {
    source = "./modules/file"
    ec2_user = "ubuntu"
    ec2_public_ip = module.ec2_create.ec2_public_ip
}

module "local_exec" {
    source = "./modules/locl_exec"
    ec2_public_ip = module.ec2_create.ec2_public_ip
}

module "remote_exec" {
    source = "./modules/remote_exec"
    ec2_user = "ubuntu"
    ec2_public_ip = module.ec2_create.ec2_public_ip
}
