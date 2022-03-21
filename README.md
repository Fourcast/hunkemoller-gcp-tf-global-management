# Hunkemöller Global Management
This repository is used for creating global resources for Hunkemöllers GCP architechture. 

## Terraform Cloud
Any merges to the main branch of this repository will be picked up by [Terraform Cloud](https://app.terraform.io/session), where terraform plan will be run. The plan will then have to be approved by an administrator of Terraform Cloud.

Important note: you should ***never*** run terraform apply locally.

## Resources to create here
- Any project that needs to be persistent. Examples: 
    - Management projects for all folders
    - Projects for the data team
- Service accounts for previously mentioned projects
- All top-level folders and sub-folders not in the sandboxe.
- IAM for sandbox folders (use the var.sandbox_roles variable from .tfvars)