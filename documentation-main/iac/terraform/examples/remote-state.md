Here are three different examples of using Terraform `remote_state` to reference the state of another Terraform configuration. This is particularly useful when you need to share data between multiple Terraform configurations.

### 1. **Using Remote State to Reference VPC ID in Another Configuration**

**Scenario:**
You have a Terraform configuration that manages a VPC, and you want to use the VPC ID in another configuration to create resources like subnets or security groups within that VPC.

**Example:**

```hcl
# First configuration (vpc.tf) managing the VPC
provider "aws" {
  region = "us-west-2"
}

resource "aws_vpc" "main" {
  cidr_block = "10.0.0.0/16"
}

output "vpc_id" {
  value = aws_vpc.main.id
}
```

```hcl
# Second configuration (subnet.tf) using the remote state of the VPC
data "terraform_remote_state" "vpc" {
  backend = "s3"
  config = {
    bucket = "my-terraform-state"
    key    = "vpc/terraform.tfstate"
    region = "us-west-2"
  }
}

resource "aws_subnet" "subnet" {
  vpc_id     = data.terraform_remote_state.vpc.outputs.vpc_id
  cidr_block = "10.0.1.0/24"
  availability_zone = "us-west-2a"
}
```

**Explanation:**
- **Remote State:** The `terraform_remote_state` data source fetches the VPC ID from the remote state stored in an S3 bucket.
- **Usage:** The VPC ID is then used to create a subnet in the VPC managed by another Terraform configuration.

**Advantages:**
- **Decoupling:** Allows separation of concerns by managing VPCs and subnets in different configurations.
- **Reusability:** Multiple configurations can reference the same VPC without duplication.

---

### 2. **Using Remote State to Share Database Endpoint between Configurations**

**Scenario:**
You have a Terraform configuration that creates a database, and you want another configuration to use the database endpoint to configure an application server.

**Example:**

```hcl
# First configuration (database.tf) managing the database
provider "aws" {
  region = "us-west-2"
}

resource "aws_db_instance" "mydb" {
  engine            = "mysql"
  instance_class    = "db.t2.micro"
  allocated_storage = 20
  name              = "mydatabase"
  username          = "admin"
  password          = "password"
}

output "db_endpoint" {
  value = aws_db_instance.mydb.endpoint
}
```

```hcl
# Second configuration (app.tf) using the remote state of the database
data "terraform_remote_state" "db" {
  backend = "s3"
  config = {
    bucket = "my-terraform-state"
    key    = "database/terraform.tfstate"
    region = "us-west-2"
  }
}

resource "aws_instance" "app_server" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  user_data = <<-EOF
              #!/bin/bash
              echo "DB_ENDPOINT=${data.terraform_remote_state.db.outputs.db_endpoint}" >> /etc/environment
              EOF
}
```

**Explanation:**
- **Remote State:** The `terraform_remote_state` data source retrieves the database endpoint from the remote state stored in S3.
- **Usage:** The retrieved endpoint is used in the `user_data` script to configure the application server.

**Advantages:**
- **Centralization:** Keeps the database management centralized while allowing other components to use its output.
- **Consistency:** Ensures that the application always points to the correct database endpoint.

---

### 3. **Using Remote State to Manage Cross-Project Dependencies**

**Scenario:**
You have multiple projects that depend on a shared set of infrastructure, like IAM roles or networking components, managed by a core Terraform configuration. Other projects need to access these shared resources.

**Example:**

```hcl
# Core configuration (shared_resources.tf) managing shared infrastructure
provider "aws" {
  region = "us-west-2"
}

resource "aws_iam_role" "shared_role" {
  name = "shared_role"
  
  assume_role_policy = jsonencode({
    Version = "2012-10-17"
    Statement = [{
      Effect = "Allow"
      Principal = {
        Service = "ec2.amazonaws.com"
      }
      Action = "sts:AssumeRole"
    }]
  })
}

output "shared_role_arn" {
  value = aws_iam_role.shared_role.arn
}
```

```hcl
# Project configuration (project.tf) using the remote state of the core infrastructure
data "terraform_remote_state" "core" {
  backend = "s3"
  config = {
    bucket = "my-terraform-state"
    key    = "shared_resources/terraform.tfstate"
    region = "us-west-2"
  }
}

resource "aws_instance" "project_instance" {
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  
  iam_instance_profile = data.terraform_remote_state.core.outputs.shared_role_arn
}
```

**Explanation:**
- **Remote State:** The `terraform_remote_state` data source accesses the ARN of an IAM role managed by the core infrastructure configuration.
- **Usage:** The IAM role is then attached to an EC2 instance in a different project.

**Advantages:**
- **Modularity:** Allows for the separation of shared infrastructure from project-specific configurations.
- **Efficiency:** Enables reusability of core infrastructure across multiple projects without duplication.

---