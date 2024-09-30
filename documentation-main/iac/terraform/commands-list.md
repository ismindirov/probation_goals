### Terraform commands 

- `terraform init` - Initialize a Terraform working directory containing configuration files.
- `terraform plan` - Create an execution plan, showing what actions Terraform will take to achieve the desired state.
- `terraform apply` - Apply the changes required to reach the desired state of the configuration.
- `terraform destroy` - Destroy the Terraform-managed infrastructure.
- `terraform refresh` - Update the state file with the real infrastructure.
- `terraform validate` - Check whether the configuration is valid.
- `terraform fmt` - Reformat configuration files to a canonical format.
- `terraform show` - Display information about the state or a plan.
- `terraform output` - Extract the value of an output variable from the state file.
- `terraform taint` - Manually mark a resource for recreation.
- `terraform untaint` - Manually unmark a resource as tainted.
- `terraform import` - Import existing infrastructure into your Terraform state.
- `terraform state` - Advanced state management.
- `terraform providers` - Display the providers required by the configuration.
- `terraform version` - Display the current Terraform version.
- `terraform workspace` - Manage workspaces.
- `terraform graph` - Generate a visual representation of the configuration dependencies.


### TFswitch 

1. **`tfswitch`** - Interactively switch between different versions of Terraform by displaying a list of available versions to choose from.
2. **`tfswitch <version>`** - Switch to a specific version of Terraform by specifying the version number. For example, `tfswitch 0.14.7` will switch to version 0.14.7.
3. **`tfswitch -l`** - List all versions of Terraform installed on your machine.
4. **`tfswitch -v`** - Show the current version of `tfswitch` installed.
5. **`tfswitch --help`** - Display the help information and usage instructions for `tfswitch`.
