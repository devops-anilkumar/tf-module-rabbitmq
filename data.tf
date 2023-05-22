# RETRIVES THE INFORMATION FROM THE REMOTE STATE FILE
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "state-terraformbucket"
    key = "vpc/${var.ENV}/terraform.tfstate"
    region = "us-east-1"
  }
}


# RETRIVES THE INFORMATION FROM THE REMOTE STATE FILE ALB
data "terraform_remote_state" "alb" {
  backend = "s3"
  config = {
    bucket = "state-terraformbucket"
    key = "alb/${var.ENV}/terraform.tfstate"
    region = "us-east-1"
  }
}

# RETRIVES THE INFORMATION FROM THE REMOTE STATE FILE databases
data "terraform_remote_state" "db" {
  backend = "s3"
  config = {
    bucket = "state-terraformbucket"
    key = "databases/${var.ENV}/terraform.tfstate"
    region = "us-east-1"
  }
}

# This is to read the information of the AMI
data "aws_ami" "lab-image" {
  most_recent      = true
  name_regex       = "my linux ami"
  owners           = ["self"]
}



# fetching the metadata of the secret
data "aws_secretsmanager_secret" "secrets" {
   name   =  "roboshop/secrets"
}

data "aws_secretsmanager_secret_version" "secrets" {
  secret_id     = data.aws_secretsmanager_secret.secrets.id
}