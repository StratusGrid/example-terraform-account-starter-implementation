<!-- BEGIN_TF_DOCS -->
<p align="center">                                                                                                                                            
                                                                                
  <img src="https://github.com/StratusGrid/terraform-readme-template/blob/main/header/stratusgrid-logo-smaller.jpg?raw=true" />
  <p align="center">                                                           
    <a href="https://stratusgrid.com/book-a-consultation">Contact Us</a> |                  
    <a href="https://stratusgrid.com/cloud-cost-optimization-dashboard">Stratusphere FinOps</a> |
    <a href="https://stratusgrid.com">StratusGrid Home</a> |
    <a href="https://stratusgrid.com/blog">Blog</a>
  </p>                    
</p>

 # Terraform Account Starter for single region deployment with deployment through CI/CD (GitHub Action)

 GitHub: [StratusGrid/terraform-account-starter](https://github.com/StratusGrid/terraform-account-starter)

 This repo contains the files for the creation of the S3 Bucket and dynamo DB table to work with a state file of Terraform in a remote location and adding the implementation of the CI/CD pipeline for appying Terraform in the same account.

 ## StratusGrid Standards we assume

 - All resource names shall use `_` and not `-`s
 - StratusGrid mostly follows the file names outlined [here](https://www.terraform-best-practices.com/code-structure), we use a `providers.tf` file for provider specific information.
 - StratusGrid mainly uses the AWS provider, and this provider supports provider level tagging. We use that whenever possible, some resources don't explicitly support it so tags need to be checked.
 - The old naming standard for common files such as inputs, outputs, providers, etc was to prefix them with a `-`, this is no longer true as it's not POSIX compliant. Our pre-commit hooks will fail with this old standard.
 - StratusGrid generally follows the TerraForm standards outlined [here](https://www.terraform-best-practices.com/naming)

 ## Repo Knowledge

 This repo has several base requirements
 - This repo is based upon the AWS `~> 5.40` provider
 - The following packages are installed via brew: `tflint`, `terrascan`, `terraform-docs`, `gitleaks`, `tfsec`, `pre-commit', 'sops`, `go`
 - If you encounter an error like `declare: -g: invalid option` reference [this](https://github.com/antonbabenko/pre-commit-terraform/issues/337) and install Bash 5
 - If you need more tflint plugins, please edit the `.tflint.hcl` file with the instructions from [here](https://github.com/terraform-linters/tflint)
 - It's highly recommend that you follow the Git Pre-Commit Instructions below, these will run in GitHub though they should be ran locally to reduce issues
 - By default Terraform docs will always run so our auto generated docs are always up to date

 ### TFSec (Deprecated)

 See the pre-commit tfsec documentation [here](https://github.com/antonbabenko/pre-commit-terraform#terraform_tfsec), this includes on how to bypass warnings

 ### Trivy

 Trivy has scanners that look for security issues, and targets where it can find those issues. TFSec was migrated to Trivy

 ### Terraform validate

 Terraform Validate can't be used in the Git Pre-Commit hooks as several resources are generated at run time

 ## Documentation

 This repo is self documenting via Terraform Docs, please see the note at the bottom.

 The way that this repo is structured is supposed to be an infrastructure starter, as well as a base psuedo code repo.
 Each file is generally self contained except where it can't be. All variables are in `variables.tf`, all data is in `data.tf`, and etc.

 ### `data.tf`
 This data file contains all references for data providers, these are fairly generic.

 ### `LICENSE`
 This is the standard Apache 2.0 License as defined [here](https://stratusgrid.atlassian.net/wiki/spaces/TK/pages/2121728017/StratusGrid+Terraform+Module+Requirements).

 ### `locals.tf`
 All local values that aren't file specific.

 ### `outputs.tf`
 The StratusGrid standard for Terraform Outputs.

 ### `provider.tf`
 This file contains the necessary provider(s) and there configurations.

 ### `README.md`
 It's` this file! I'm always updated via TF Docs!

 ### `s3-bucket-logging.tf`
 This contains the SG module for setting up a logging bucket, it's replicated once for each US based region. This file needs to have parts uncommented if using centralized logging.

 ### `s3-bucket-terraform-state.tf`
 This contains the SG module for setting up our TF centralized remote state S3 bucket and KMS Key.

 ### `state.tfnot`
 The StratusGrid standard for Terraform remote state management.
 Rename this file to `state.tf` once you're ready to migrate to the remote state.

 ### `tags.tf`
 The StratusGrid standard for provider/module level tagging.

 ### `variables.tf`
 All variables related to this repo for all facets.
 One day this should be broken up into each file, maybe maybe not.

 ### `versions.tf`
 This file contains the required Terraform versions, as well as the required providers and their versions.


 ### Documentation

 The detailed documentation for this example repo can be found in https://stratusgrid.atlassian.net/wiki/spaces/PRSRV/pages/edit-v2/2711846924?draftShareId=b02d10d2-9f4a-4ee8-aece-0a6cb136db29&inEditorTemplatesPanel=auto_closed


 ## Documentation of Misc Config Files

 This section is supposed to outline what the misc configuration files do and what is there purpose

 ### `.config/.terraform-docs.yml`
 This file auto generates your `README.md` file.

 ### `.config/terrascan.yaml`
 This file has all of the configuration options required for Terrascan, this is where you would skip rules to.

 ### `.github/sync-repo-settings.yaml`
 This file is our standard for how GitHub branch protection rules should be setup.

 ### `.github/workflows/pre-commit.yml`
 This file contains the instructions for Github workflows, in specific this file run pre-commit and will allow the PR to pass or fail. This is a safety check and extras for if pre-commit isn't run locally.

 ### `.gitignore`
 This is your gitignore, and contains a slew of default standards.

 ### `.terraform.lock.hcl`
 This file contains the hashes of the Terraform providers and modules we're using.

 ---

 ## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | >= v1.7.4 |
| <a name="requirement_aws"></a> [aws](#requirement\_aws) | ~> 5.40.0 |

 ## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_s3_bucket_logging"></a> [s3\_bucket\_logging](#module\_s3\_bucket\_logging) | StratusGrid/s3-bucket-logging/aws | 2.1.4 |
| <a name="module_terraform_state"></a> [terraform\_state](#module\_terraform\_state) | StratusGrid/terraform-state-s3-bucket-centralized-with-roles/aws | 5.1.1 |

 ## Resources

| Name | Type |
|------|------|

 ## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_append_name_suffix"></a> [append\_name\_suffix](#input\_append\_name\_suffix) | String to append to the name\_suffix used on object names. This is optional, so start with dash if using like so: -mysuffix. This will result in prefix-objectname-env-mysuffix | `string` | `""` | no |
| <a name="input_env_name"></a> [env\_name](#input\_env\_name) | Environment name string to be used for decisions and name generation. Appended to name\_suffix to create full\_suffix | `string` | n/a | yes |
| <a name="input_name_prefix"></a> [name\_prefix](#input\_name\_prefix) | String to use as prefix on object names. | `string` | n/a | yes |
| <a name="input_override_name_suffix"></a> [override\_name\_suffix](#input\_override\_name\_suffix) | String to completely override the name\_suffix | `string` | `""` | no |
| <a name="input_prepend_name_suffix"></a> [prepend\_name\_suffix](#input\_prepend\_name\_suffix) | String to prepend to the name\_suffix used on object names. This is optional, so start with dash if using like so: -mysuffix. This will result in prefix-objectname-mysuffix-env | `string` | `""` | no |
| <a name="input_region"></a> [region](#input\_region) | AWS Region to target | `string` | n/a | yes |
| <a name="input_source_repo"></a> [source\_repo](#input\_source\_repo) | URL of the repo which holds this code | `string` | n/a | yes |

 ## Outputs

| Name | Description |
|------|-------------|
| <a name="output_account_id"></a> [account\_id](#output\_account\_id) | Account which terraform was run on |
| <a name="output_common_tags"></a> [common\_tags](#output\_common\_tags) | tags which should be applied to all taggable objects |
| <a name="output_name_prefix"></a> [name\_prefix](#output\_name\_prefix) | string to prepend to all resource names |
| <a name="output_name_suffix"></a> [name\_suffix](#output\_name\_suffix) | string to append to all resource names |
| <a name="output_region"></a> [region](#output\_region) | region being used |
| <a name="output_terraform_state_bucket"></a> [terraform\_state\_bucket](#output\_terraform\_state\_bucket) | s3 bucket to store terraform state |
| <a name="output_terraform_state_config_s3_key"></a> [terraform\_state\_config\_s3\_key](#output\_terraform\_state\_config\_s3\_key) | key to use for terraform state key configuration - this is the s3 object key where the config will be stored |
| <a name="output_terraform_state_dynamodb_table"></a> [terraform\_state\_dynamodb\_table](#output\_terraform\_state\_dynamodb\_table) | dynamodb table to control terraform locking |
| <a name="output_terraform_state_kms_key_arn"></a> [terraform\_state\_kms\_key\_arn](#output\_terraform\_state\_kms\_key\_arn) | kms key to use for encrytption when storing/reading terraform state configuration |


 ---
 ## Assumptions we make

 * We assume a basic knowledge of terraform
 * We assume StratusGrid written and unwritten (Listen I know, if you find an unwritten standard please standardize and it document it) standards
 * We assume you know how to switch TF states to new envs
 * We assume that if you find something wrong or have an improvement you will submit a PR and run terraform-docs
 * **Of all most importance, we assume that you read this or at least skimmed this README file**

 ## Just a note

 ### First Run

 When doing a first run update the init-tfvars tfvars file for the relevant values produced via the account starter.
 After the initial and the terraform state file is created. Rename `state.tfnot` to `state.tf` and run `rm -rf .terraform`. Then rerun the terraform init to migrate the state file to S3.

 This is purely an example repo and it's subject to change for each and every client, please use your best judgement. While adhering to StratusGrids' Standards.

 ## Apply this template via Terraform

 ### Before this is applied, you need to configure the git hook on your local machine
 ```bash
 #Verify you have bash5
 brew install bash

 # Test your pre-commit hooks - This will force them to run on all files
 pre-commit run --all-files

 # Add your pre-commit hooks forever
 pre-commit install
 ```

 ### Dev
 ```bash
 terraform init -backend-config=./init-tfvars/dev.tfvars
 terraform apply -var-file ./apply-tfvars/dev.tfvars
 ```

 ### Stg
 ```bash
 terraform init -backend-config=./init-tfvars/stg.tfvars
 terraform apply -var-file ./apply-tfvars/stg.tfvars
 ```

 ### Prd
 ```bash
 terraform init -backend-config=./init-tfvars/prd.tfvars
 terraform apply -var-file ./apply-tfvars/prd.tfvars
 ```
 Note: Before reading, uncomment the code for the environment that you
 wish to apply the code to. This goes for both the init-tfvars and apply-tfvars
 folders.

 For situation with multiple environments we expected to make the deployment through the CICD Tool (GitHub actions) so the code should be in sync in all environment, for different configuration amoing them we should use variable files.

 ## Contributors
 - Chris Hurst [StratusChris](https://github.com/StratusChris)
 - Ivan Casco [ivancasco-sg](https://github.com/ivancasco-sg)
 - Tyler Martin [SGTyler](https://github.com/SGTyler)
 - Wesley Kirkland [wesleykirklandsg](https://github.com/wesleykirklandsg)

 Note, manual changes to the README will be overwritten when the documentation is updated. To update the documentation, run `terraform-docs -c .config/.terraform-docs.yml .`
<!-- END_TF_DOCS -->