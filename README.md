# Demo Landing Zone

// TODO add overview

// TODO add build status badges

// TODO add reference architecture

## Architecture

### Overview

### Layers

## :rocket: Getting started

### Pre-requisites

1. Terraform
2. Azure Subscription to deploy to

### Setting up your environment

1. Install Terraform
2. [Optional] Install Pre-Commit
3. Setting up your Azure Credentials

### Doing your first deployment

1. Navigate to Solutions/App
1. Take a look at the Parameters/uat.tfvars

- Update the variable file to represent your environment

1. Save the updated variable file as terraform.tfvars inside the `Solutions/App/` directory
1. Update the remote state backend to your storage account within the [version.tf](Solutions/App/version.tf) file
1. Run `terraform init`

- This will initialize your remote state backend and pull any additional providers the deployment requires.

1. Run `terraform plan`.

- This will show you the proposed changes based on state.

1. Run `terraform apply`.

- This will apply the proposed changes into your Azure subscription.
- Type `yes` into the prompt if the plan output looks good.

// TODO add getting started instructions

## Contributing

This project welcomes contributions and suggestions.  Most contributions require you to agree to a
Contributor License Agreement (CLA) declaring that you have the right to, and actually do, grant us
the rights to use your contribution. For details, visit <https://cla.opensource.microsoft.com>.

When you submit a pull request, a CLA bot will automatically determine whether you need to provide
a CLA and decorate the PR appropriately (e.g., status check, comment). Simply follow the instructions
provided by the bot. You will only need to do this once across all repos using our CLA.

## Code of conduct

This project has adopted the [Microsoft Open Source Code of Conduct](https://opensource.microsoft.com/codeofconduct/).
For more information see the [Code of Conduct FAQ](https://opensource.microsoft.com/codeofconduct/faq/) or
contact [opencode@microsoft.com](mailto:opencode@microsoft.com) with any additional questions or comments.
