# These variables are called when running the following command:
# terraform init -backend-config=./init-tfvars/prd.tfvars
bucket         = "iac-remote-state-backend-dev-infra"
dynamodb_table = "iac-remote-state-backend-dev-infra"
key            = "iac-account-dev-infra.tfstate"
kms_key_id     = "arn:aws:kms:us-east-1:327110749334:key/07247b5e-993e-460a-a6e7-ef3ac421a0bf"