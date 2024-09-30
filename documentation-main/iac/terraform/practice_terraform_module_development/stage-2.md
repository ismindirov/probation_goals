# Variables Types and Defaults

**Theory:**
Variables in Terraform allow you to parameterize configurations, making them flexible and reusable. They can be assigned types and default values to control the behavior of your Terraform configurations.

- **Variable Types**:
  - **String**: A single line of text.
  - **Number**: A numeric value, either integer or float.
  - **Bool**: A boolean value (`true` or `false`).
  - **List**: A collection of values, all of the same type.
  - **Map**: A collection of key-value pairs.
  - **Object**: A structured type containing named attributes that each have their own type.
  - **Tuple**: A sequence of elements, each of a different type.

- **Default Values**:
  - **Definition**: Default values allow you to specify a fallback value if a variable is not provided.
  - **How it Works**: If the user does not supply a value for a variable, Terraform uses the default.
  - **Advantages**:
    - **Flexibility**: Allows optional variables without requiring the user to always provide a value.
    - **Consistency**: Provides a consistent default behavior.

**Practical Task**:

- **Objective**: Define variables with different types and assign default values.
- **Steps**:
  1. **Create a `variables.tf` file**:
     - Define variables with different types and defaults:

       ```hcl
       variable "environment" {
         type    = string
         default = "dev"
       }

       variable "instance_count" {
         type    = number
         default = 2
       }

       variable "enable_logging" {
         type    = bool
         default = true
       }

       variable "allowed_ips" {
         type    = list(string)
         default = ["0.0.0.0/0"]
       }

       variable "tags" {
         type = map(string)
         default = {
           Name        = "example"
           Environment = "dev"
         }
       }
       ```

     - Reference these variables in your `main.tf` file.

  2. **Deploy the Configuration**:
     - Run `terraform init` and `terraform apply`.
     - Observe how default values are used if no explicit values are provided.

- **Definition of Done**: Variables are correctly used within the configuration, and default values are applied where expected.


# Outputs and Related Operations: How to Transform Outputs Using Functions

**Theory:**
Outputs in Terraform are used to display values from your configuration, which can be used as input to other modules or simply to provide useful information after a Terraform run.

- **Outputs**:
  - **Definition**: Outputs allow you to expose information about your infrastructure, such as resource IDs, IP addresses, or other useful data.
  - **How it Works**: Define outputs in `outputs.tf`, and Terraform will display them after a successful apply.
  - **Advantages**:
    - **Visibility**: Easily access critical information about deployed resources.
    - **Integration**: Use outputs in other modules or scripts.

- **Transforming Outputs**:
  - **Functions**: Terraform provides various functions to manipulate output data, such as `join`, `split`, `length`, and `format`.
  - **Use Cases**:
    - Formatting strings, concatenating lists, or extracting specific elements from data structures.

**Practical Task**:

- **Objective**: Create outputs and transform them using Terraform functions.
- **Steps**:
  1. **Define Outputs in `outputs.tf`**:
     - Example outputs with transformations:

       ```hcl
       output "vpc_id" {
         value = aws_vpc.main.id
       }

       output "formatted_ip_range" {
         value = join(", ", aws_vpc.main.cidr_block_association_ids)
       }

       output "instance_count_message" {
         value = format("You have %d instances", var.instance_count)
       }
       ```

  2. **Deploy the Configuration**:
     - Run `terraform apply`.
     - Observe the outputs in the Terraform CLI output, ensuring that they are formatted and transformed as expected.

- **Definition of Done**: Outputs are displayed correctly, with transformations applied using Terraform functions.