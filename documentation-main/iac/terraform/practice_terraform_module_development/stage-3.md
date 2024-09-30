# Terraform conditional expression

**Overview:**
The `if` in Terraform is a conditional expression that allows you to choose between two values based on a boolean condition. It is part of the ternary conditional syntax in Terraform, represented by `condition ? true_value : false_value`. This is useful for making configurations more dynamic and responsive to different input conditions.

### Key Concepts

1. **Conditional Expressions:**
   - Terraform's `if` allows for the evaluation of a condition, returning one value if the condition is true and another if it is false.
   - It helps to simplify configurations by reducing the need for repetitive code and making configurations more adaptable to different environments.

2. **Syntax:**
   - The general syntax for the `if` is:

     ```hcl
     condition ? true_value : false_value
     ```

   - `condition` is the expression that Terraform evaluates.
   - If `condition` is true, `true_value` is returned; if false, `false_value` is returned.

3. **Use Cases:**
   - The `if` is commonly used to set default values, manage optional resources, or adjust configurations based on specific conditions (e.g., environment settings, resource availability).

### Practical Example

#### Scenario: Configuring `root_block_device` in an AWS EC2 Instance

**Objective:**
Use the `if` to conditionally configure the `root_block_device` for an AWS EC2 instance in Terraform. If no custom block device configuration is provided, the instance should use default values for the disk type, size, and termination behavior.

**Example Code:**

```hcl
variable "root_block_device" {
  description = "Custom root block device configuration"
  type        = list(map(string))
  default     = []
}

variable "instance_disk_type" {
  description = "Type of the instance disk (e.g., gp2, io1)"
  type        = string
  default     = "gp2"
}

variable "instance_disk_size" {
  description = "Size of the instance disk in GB"
  type        = number
  default     = 30
}

variable "instance_disk_delete_on_termination" {
  description = "Whether the disk should be deleted on instance termination"
  type        = bool
  default     = true
}

resource "aws_instance" "example" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"

  root_block_device = length(var.root_block_device) == 0 ? [
    {
      volume_type           = var.instance_disk_type
      volume_size           = var.instance_disk_size
      delete_on_termination = var.instance_disk_delete_on_termination
    }
  ] : var.root_block_device
}
```

**Explanation:**

- **Condition**: `length(var.root_block_device) == 0`
  - This checks if the `root_block_device` variable is empty (i.e., the length is zero).
  - If `true`, Terraform will use the default disk configuration specified within the `if` operator.
  - If `false`, it will use the custom `root_block_device` configuration provided by the user.

- **True Value**:

  ```hcl
  [
    {
      volume_type           = var.instance_disk_type
      volume_size           = var.instance_disk_size
      delete_on_termination = var.instance_disk_delete_on_termination
    }
  ]
  ```

  - This defines a default block device with the specified type, size, and termination behavior.

- **False Value**: `var.root_block_device`
  - If a custom block device configuration is provided, it will be used directly.

**Practical Task:**

1. **Objective**: Implement and test the conditional block device configuration in Terraform.
2. **Steps**:
   1. Create a Terraform configuration file (`main.tf`) using the provided code.
   2. Customize the `root_block_device` variable to see how the instance configuration changes with and without this value.
   3. Run `terraform init` to initialize the working directory.
   4. Run `terraform apply` to create the instance with the desired configuration.
   5. Inspect the AWS Management Console or use `terraform show` to verify the instance's block device configuration.

3. **Definition of Done**:
   - Successfully deploy an EC2 instance with the conditional `root_block_device` configuration.
   - Verify that the instance uses the default block device settings when no custom configuration is provided and that it uses the custom configuration when specified.

---

# Using Data Sources for Existing Resources

**Overview:**
Terraform data sources allow you to fetch data from existing infrastructure resources managed outside your Terraform configuration or by another Terraform configuration. This is useful for referencing existing resources that you don't want to manage directly in Terraform.

**Theory:**

- **Syntax**: Data sources are defined using the `data` block in Terraform.
  
  ```hcl
  data "aws_instance" "example" {
    instance_id = "i-12345678"
  }
  ```

- **Use Cases**:
  - Fetching information about resources not managed by Terraform.
  - Using existing resources in new configurations without re-creating them.

  **Advantages**:
  - **Integration**: Easily integrates with existing infrastructure.
  - **Efficiency**: Reduces the need to re-create existing resources.

  **Disadvantages**:
  - **Limited Control**: You can read data but cannot modify or delete the resource through Terraform.
  - **Dependency**: Changes in external resources might affect Terraform configurations that rely on them.

**Practical Task**:

- **Objective**: Use a data source to retrieve information about an existing AWS instance and output its details.
- **Steps**:
  1. Define a data source in your `main.tf`:

     ```hcl
     data "aws_instance" "example" {
       instance_id = "i-12345678"
     }
     ```

  2. Output the retrieved data:

     ```hcl
     output "instance_details" {
       value = data.aws_instance.example
     }
     ```

  3. Apply the configuration:

     ```bash
     terraform apply
     ```

- **Definition of Done**: Retrieve and display the details of an existing AWS instance using a data source.

---

# Configuring Remote State

**Overview:**
Terraform's remote state allows you to store state files in a remote location, enabling collaboration and state locking. This is essential for team-based projects to prevent conflicts and ensure the most up-to-date state is used during deployments. Additionally, you can use values from one Terraform configuration’s remote state in another configuration, promoting reusability and modular infrastructure.

**Theory:**

- **Syntax**: Remote state is configured using a `backend` block in your Terraform configuration.
  
  ```hcl
  terraform {
    backend "s3" {
      bucket = "my-terraform-state"
      key    = "path/to/my/key"
      region = "us-west-2"
    }
  }
  ```

- **Use Cases**:
  - Team collaboration on Terraform projects.
  - Centralized management of state files.
  - Sharing outputs from one configuration with another via remote state.
  
  **Advantages**:
  - **Collaboration**: Multiple team members can work on the same infrastructure without state conflicts.
  - **Security**: State files can be secured with access controls and encryption.
  - **Modularity**: Enables reuse of infrastructure outputs across different configurations.

  **Disadvantages**:
  - **Complexity**: Requires proper setup of remote storage and access permissions.
  - **Cost**: Depending on the remote storage service used, there may be additional costs.

**Practical Task**:

- **Objective**: Configure remote state storage using AWS S3, retrieve a value from this remote state, and use it as a parameter in another Terraform configuration.

### Steps

#### Part 1: Configure and Store the Remote State

1. **Configure the `backend` block in your first Terraform configuration (`network.tf`)**:

   ```hcl
   terraform {
     backend "s3" {
       bucket = "my-terraform-state"
       key    = "network/terraform.tfstate"
       region = "us-west-2"
     }
   }

   output "vpc_id" {
     value = aws_vpc.main.id
   }
   ```

2. **Deploy the first Terraform configuration to create a VPC**:

   ```bash
   terraform init
   terraform apply
   ```

3. **Confirm the remote state is stored in the specified S3 bucket** by checking the AWS S3 console.

#### Part 2: Use Remote State as a Value in Another Configuration

1. **In your second Terraform configuration (`app.tf`), reference the remote state**:

   ```hcl
   data "terraform_remote_state" "network" {
     backend = "s3"
     config = {
       bucket = "my-terraform-state"
       key    = "network/terraform.tfstate"
       region = "us-west-2"
     }
   }

   resource "aws_instance" "app_server" {
     ami           = "ami-12345678"
     instance_type = "t2.micro"

     vpc_security_group_ids = [data.terraform_remote_state.network.outputs.vpc_id]
     subnet_id              = data.terraform_remote_state.network.outputs.subnet_id
   }
   ```

2. **Deploy the second Terraform configuration**:

   ```bash
   terraform init
   terraform apply
   ```

- **Definition of Done**: Successfully retrieve the VPC ID from the first Terraform configuration’s remote state and use it to deploy an EC2 instance in the second configuration.
---