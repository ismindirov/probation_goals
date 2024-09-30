### Creating a Basic Terraform Module Using a Data Source

Creating a Terraform module involves encapsulating a configuration into a reusable module. Here, we will create a module that uses a data source to fetch information from AWS and deploys an EC2 instance using that data.

#### 1. Module Structure

**Overview:**
A Terraform module is a collection of .tf files stored in the same directory. Each module should have a clear structure to maintain readability and reusability.

**Key Points:**

- **Module Structure**:
  - **Theory**: Modules should follow a standard structure to ensure they are reusable and maintainable. A typical module includes:
    - `main.tf`: Contains the primary resource definitions.
    - `variables.tf`: Defines input variables for the module.
    - `outputs.tf`: Defines outputs from the module.
    - `data.tf`: (Optional) Defines data sources used in the module.
  - **Advantage**: Modular code increases reusability and maintainability, reducing duplication and making it easier to manage infrastructure at scale.
  - **Disadvantage**: Increased complexity in understanding the overall configuration due to module abstraction.
  - **Example**: Example structure for an EC2 module.

    ```plaintext
    ├── main.tf
    ├── variables.tf
    ├── outputs.tf
    ├── data.tf
    ```

**Official Documentation and Resources:**

- [Terraform Modules](https://www.terraform.io/docs/language/modules/index.html) - Introduction to Modules
- [Creating Modules](https://learn.hashicorp.com/tutorials/terraform/module) - Tutorial on Creating Modules

#### 2. Define Input Variables (`variables.tf`)

**Theory**: Variables allow customization of the module's behavior. They are defined in a `variables.tf` file and can be passed in when the module is instantiated.

**Example**:

```hcl
variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "ami_filter" {
  description = "Filter criteria for fetching the AMI"
  type        = map(string)
  default     = {
    name   = "amzn2-ami-hvm-*-x86_64-gp2"
    owners = ["amazon"]
  }
}

variable "instance_count" {
  description = "Number of instances to launch"
  type        = number
  default     = 1
}
```

**Practical Task**:
- **Objective**: Define input variables for the EC2 module.
- **Steps**:
  1. Create a `variables.tf` file in the module directory.
  2. Define the necessary input variables as shown in the example.
- **Definition of Done**: Input variables are defined and can be customized when the module is used.

#### 3. Define Data Source (`data.tf`)

**Theory**: Data sources allow you to fetch information from external sources that can be used within your configuration. This is useful for retrieving AMI IDs, VPC IDs, etc., without hardcoding them.

**Example**:

```hcl
data "aws_ami" "selected" {
  most_recent = true
  filter {
    name   = "name"
    values = [var.ami_filter["name"]]
  }
  owners = var.ami_filter["owners"]
}
```

**Practical Task**:
- **Objective**: Define a data source to fetch the latest AMI ID.
- **Steps**:
  1. Create a `data.tf` file in the module directory.
  2. Define the data source as shown in the example.
- **Definition of Done**: The data source fetches the latest AMI ID based on the filter criteria.

#### 4. Define Resources (`main.tf`)

**Theory**: Resources are the infrastructure components managed by Terraform. They are defined in the `main.tf` file and use the data from the data sources and input variables.

**Example**:

```hcl
resource "aws_instance" "example" {
  count         = var.instance_count
  ami           = data.aws_ami.selected.id
  instance_type = var.instance_type

  tags = {
    Name = "ExampleInstance"
  }
}
```

**Practical Task**:
- **Objective**: Define an EC2 instance resource using the fetched AMI ID and input variables.
- **Steps**:
  1. Create a `main.tf` file in the module directory.
  2. Define the EC2 instance resource as shown in the example.
- **Definition of Done**: The EC2 instance is defined and uses the data source and variables.

#### 5. Define Outputs (`outputs.tf`)

**Theory**: Outputs are values that are returned from the module and can be used in other parts of the configuration. They are defined in the `outputs.tf` file.

**Example**:

```hcl
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.example.*.id
}
```

**Practical Task**:
- **Objective**: Define outputs for the module.
- **Steps**:
  1. Create an `outputs.tf` file in the module directory.
  2. Define the necessary outputs as shown in the example.
- **Definition of Done**: Outputs are defined and provide useful information from the module.

**Official Documentation and Resources:**

- [Terraform Outputs](https://www.terraform.io/docs/language/values/outputs.html) - Overview of Outputs

### Complete Example Module

Here is a complete example of the EC2 module:

**variables.tf**:

```hcl
variable "instance_type" {
  description = "Type of the EC2 instance"
  type        = string
  default     = "t2.micro"
}

variable "ami_filter" {
  description = "Filter criteria for fetching the AMI"
  type        = map(string)
  default     = {
    name   = "amzn2-ami-hvm-*-x86_64-gp2"
    owners = ["amazon"]
  }
}

variable "instance_count" {
  description = "Number of instances to launch"
  type        = number
  default     = 1
}
```

**data.tf**:

```hcl
data "aws_ami" "selected" {
  most_recent = true
  filter {
    name   = "name"
    values = [var.ami_filter["name"]]
  }
  owners = var.ami_filter["owners"]
}
```

**main.tf**:

```hcl
resource "aws_instance" "example" {
  count         = var.instance_count
  ami           = data.aws_ami.selected.id
  instance_type = var.instance_type

  tags = {
    Name = "ExampleInstance"
  }
}
```

**outputs.tf**:

```hcl
output "instance_id" {
  description = "ID of the EC2 instance"
  value       = aws_instance.example.*.id
}
```

### Using the Module

To use this module in your Terraform configuration, you can call it as follows:

```hcl
module "ec2_instance" {
  source        = "./path-to-your-module"
  instance_type = "t2.small"
  ami_filter = {
    name   = "amzn2-ami-hvm-*-x86_64-gp2"
    owners = ["amazon"]
  }
  instance_count = 2
}
```

**Practical Task**:
- **Objective**: Use the created module to deploy EC2 instances.
- **Steps**:
  1. Create a Terraform configuration that calls the module.
  2. Customize the input variables as needed.
  3. Run the Terraform commands to deploy the infrastructure:

     ```sh
     terraform init
     terraform plan
     terraform apply
     ```

- **Definition of Done**: Successfully deploy EC2 instances using the module and verify the outputs.