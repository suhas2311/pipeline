
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

data "aws_ami" "get_k8s_master_ami" {
    most_recent = true
    owners = ["639218562896"]
    tags = {
      Name = "k8s"
    }

    filter {
      name = "state"
      values = ["available"]
    }

    filter {
      name = "tag:Name"
      values = ["k8s"]
    }
}

module "create_k8s_master_node" {
    source = "./modules/ec2_instance"
    k8s_ami = data.aws_ami.get_k8s_master_ami.image_id
    k8s_instance_type = var.module_k8s_instance_type
}


# provider "" {
  
# }

# data "" "name" {
  
# }

# resource "" "name" {
  
# }

# variable "" {
  
# }

# output "name" {
  
# }

