### Terraform Modules Development

#### 1. Module Understanding: Difference Between Using and Writing Terraform Modules

**Theory:**
Terraform modules are reusable sets of Terraform configurations that enable you to organize and encapsulate resources in a clean and manageable way. Modules can be used to create consistent configurations across different environments or projects, reducing repetition and improving maintainability.

- **Using Modules**:
  - **Definition**: Using a module in Terraform means consuming a pre-written module in your configurations. This allows you to leverage existing resources without reinventing the wheel.
  - **How it Works**: You simply reference the module source, provide the necessary input variables, and Terraform handles the rest.
  - **Advantages**:
    - **Consistency**: Ensures consistent resource definitions across different environments.
    - **Speed**: Saves time by reusing tested configurations.
    - **Ease of Use**: Simplifies complex setups by abstracting detailed configurations.

- **Writing Modules**:
  - **Definition**: Writing a module involves creating your own reusable set of configurations. This includes defining resources, variables, and outputs that can be used across multiple projects or environments.
  - **How it Works**: You define a module with its own `main.tf`, `variables.tf`, and `outputs.tf` files. The module is then referenced from other configurations.
  - **Advantages**:
    - **Customization**: Tailor modules to meet specific requirements.
    - **Reusability**: Once written, modules can be reused across different projects, increasing efficiency.

**Practical Task**:

- **Objective**: Practice using and writing Terraform modules.
- **Steps**:
  1. **Using a Pre-Written Module**:
     - Create a new Terraform configuration file (`main.tf`).
     - Reference a publicly available module from the Terraform Registry, such as an AWS VPC module:

       ```hcl
       module "vpc" {
         source  = "terraform-aws-modules/vpc/aws"
         version = "3.11.0"
         cidr    = "10.0.0.0/16"
         ...
       }
       ```

     - Run `terraform init` and `terraform apply` to deploy the module.

  2. **Writing a Simple Module**:
     - Create a new directory for your module (`terraform-modules/simple-vpc`).
     - In this directory, create a `main.tf` file to define resources, `variables.tf` for input variables, and `outputs.tf` for outputs:

       ```hcl
       # main.tf
       resource "aws_vpc" "this" {
         cidr_block = var.cidr
         ...
       }
       ```

     - Reference this module from another Terraform configuration by specifying the path to your module:

       ```hcl
       module "custom_vpc" {
         source = "./terraform-modules/simple-vpc"
         cidr   = "10.0.0.0/16"
       }
       ```

     - Run `terraform init` and `terraform apply` to deploy the custom module.

- **Definition of Done**: Successfully deploy infrastructure using a pre-written module and your custom-written module, confirming the ability to use and create Terraform modules.


### Using Default Values for Variables in Terraform; Using variables.

**Overview:**
In Terraform, variables are a fundamental way to make configurations more flexible and reusable. Variables can have default values, which are used when no other value is provided. Default values allow you to set common configurations while still enabling customization when needed.

### Key Concepts

1. **Variable Declaration with Defaults:**
   - A variable in Terraform can be declared with a default value. If the user or configuration does not override the variable, Terraform uses this default value.
   - Declaring variables with defaults is useful for providing sensible defaults for common use cases, reducing the need for repetitive configuration.

2. **Overriding Defaults:**
   - While default values provide a fallback, they can be easily overridden by setting the variable in the Terraform CLI, environment variables, or `tfvars` files.
   - This flexibility allows you to adjust configurations for different environments or requirements without modifying the main Terraform code.

3. **Syntax:**
   - The syntax for declaring a variable with a default value is straightforward:

     ```hcl
     variable "variable_name" {
       description = "Description of the variable"
       type        = type   # optional, inferred if not specified
       default     = default_value
     }
     ```

4. **Use Cases:**
   - Default values are commonly used for variables like instance types, disk sizes, region settings, and other parameters where a sensible default can simplify the configuration for most users.

### Practical Example

#### Scenario: Configuring an AWS EC2 Instance with Default Variables

**Objective:**
Define variables with default values for an AWS EC2 instance. These variables will include the instance type, AMI ID, and disk size. The configuration will allow customization by overriding these defaults if needed.

**Example Code:**

```hcl
variable "instance_type" {
  description = "The type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "ami_id" {
  description = "The AMI ID for the EC2 instance"
  type        = string
  default     = "ami-0c55b159cbfafe1f0"
}

variable "disk_size" {
  description = "The size of the root disk in GB"
  type        = number
  default     = 8
}

resource "aws_instance" "example" {
  ami           = var.ami_id
  instance_type = var.instance_type

  root_block_device {
    volume_size = var.disk_size
  }
}
```

**Explanation:**

- **Default Values**:
  - `instance_type`: Defaults to `"t2.micro"`, a common choice for small workloads.
  - `ami_id`: Defaults to `"ami-0c55b159cbfafe1f0"`, representing a specific Amazon Linux AMI.
  - `disk_size`: Defaults to `8`, which is the size in GB for the root disk.

- **Overriding Defaults**:
  - These defaults can be overridden by specifying values when running Terraform commands, in a `.tfvars` file, or as environment variables.

**Practical Task:**

1. **Objective**: Implement a Terraform configuration with default variables and deploy an AWS EC2 instance.
2. **Steps**:
   1. Create a Terraform configuration file (`main.tf`) using the provided example code.
   2. Run `terraform init` to initialize the working directory.
   3. Apply the configuration using the default values:

      ```bash
      terraform apply
      ```

   4. Override one or more default values by passing variables via the command line:

      ```bash
      terraform apply -var="instance_type=t3.micro" -var="disk_size=20"
      ```

   5. Inspect the instance in the AWS Management Console or use `terraform show` to verify the configuration.

3. **Definition of Done**:
   - Successfully deploy an EC2 instance using default variable values.
   - Override the default values to verify that Terraform correctly applies the customized settings.
   - Confirm that the instance is created with the expected instance type, AMI, and disk size.