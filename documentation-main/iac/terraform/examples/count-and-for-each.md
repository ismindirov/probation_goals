### Extended Examples of Using **`for_each`** and **`count`**

In this section, we will explore several extended examples demonstrating how to use the **`for_each`** and **`count`** meta-arguments for different goals in Terraform. Alongside these examples, we'll provide detailed explanations to help you understand how and why each approach is used.

---

### **Example 1: Creating Multiple EC2 Instances Using `count`**

#### Goal: Provision Identical Resources

**Scenario**:  
You need to create a number of EC2 instances with identical configurations, such as the same AMI, instance type, and security group. The only difference is their name tag.

**Explanation**:  
The `count` argument allows us to define a fixed number of resources by specifying an integer value. This is ideal for scenarios where you want identical resources (e.g., servers or databases) with minor differences (e.g., tags or IP addresses).

**Terraform Code**:

```hcl
variable "instance_count" {
  default = 3
}

resource "aws_instance" "web" {
  count         = var.instance_count
  ami           = "ami-0c55b159cbfafe1f0"  # Example Amazon Linux 2 AMI
  instance_type = "t2.micro"

  tags = {
    Name = "WebInstance-${count.index + 1}"
  }
}
```

**Explanation**:
- `count = var.instance_count`: This creates a number of EC2 instances based on the `instance_count` variable. In this case, it will create three instances.
- `count.index`: This returns the index number of each instance (starting from `0`), allowing us to create unique tags for each instance like `WebInstance-1`, `WebInstance-2`, and `WebInstance-3`.

**Output**:
Terraform will create three EC2 instances, each with the same AMI and instance type, but with unique name tags.

**Use Case**:
- **Pros**: Simple and efficient for creating multiple identical resources.
- **Cons**: Lacks flexibility when dealing with different configurations for each resource.

---

### **Example 2: Provisioning Multiple S3 Buckets with Different Configurations Using `for_each`**

#### Goal: Provision Resources with Unique Configurations

**Scenario**:  
You need to create multiple S3 buckets, each with a unique name and different tags. The bucket configurations vary, so `for_each` is the better choice.

**Explanation**:  
`for_each` allows you to iterate over a map or set of values and create a resource for each key-value pair. Each resource can have its own unique properties, making `for_each` useful when the configuration for each resource differs.

**Terraform Code**:

```hcl
variable "s3_buckets" {
  default = {
    bucket1 = {
      bucket_name = "my-app-logs"
      environment = "dev"
    }
    bucket2 = {
      bucket_name = "my-app-backup"
      environment = "prod"
    }
    bucket3 = {
      bucket_name = "my-app-assets"
      environment = "test"
    }
  }
}

resource "aws_s3_bucket" "bucket" {
  for_each = var.s3_buckets

  bucket = each.value.bucket_name

  tags = {
    Environment = each.value.environment
    Name        = each.key
  }
}
```

**Explanation**:
- `for_each = var.s3_buckets`: We iterate over the `s3_buckets` variable, which is a map of bucket configurations.
- `each.value.bucket_name`: Each bucket will have a unique name retrieved from the map.
- `each.value.environment`: The `environment` tag for each bucket is dynamically set based on the map.

**Output**:
Terraform will create three S3 buckets with unique names (`my-app-logs`, `my-app-backup`, and `my-app-assets`) and apply specific environment tags (`dev`, `prod`, `test`) to each bucket.

**Use Case**:
- **Pros**: Highly flexible when you need to manage resources with varying configurations.
- **Cons**: Slightly more complex to manage than `count`.

---

### **Example 3: Managing Security Groups for Different Environments Using `for_each`**

#### Goal: Create Environment-Specific Security Groups

**Scenario**:  
You need to create security groups for different environments (e.g., dev, staging, prod), where each environment has different inbound rules.

**Explanation**:  
With `for_each`, you can define security group rules that vary based on the environment. This is a great example of how `for_each` is used to apply unique configurations across different resources.

**Terraform Code**:

```hcl
variable "environment_sg" {
  default = {
    dev = {
      description = "Allow HTTP traffic for dev"
      cidr_blocks = ["0.0.0.0/0"]
    }
    staging = {
      description = "Allow HTTP and HTTPS traffic for staging"
      cidr_blocks = ["0.0.0.0/0"]
    }
    prod = {
      description = "Allow HTTPS traffic only for prod"
      cidr_blocks = ["0.0.0.0/0"]
    }
  }
}

resource "aws_security_group" "sg" {
  for_each = var.environment_sg

  name        = "${each.key}-security-group"
  description = each.value.description
  vpc_id      = aws_vpc.main.id

  ingress {
    from_port   = 80
    to_port     = 80
    protocol    = "tcp"
    cidr_blocks = each.value.cidr_blocks
  }

  tags = {
    Name = "${each.key}-security-group"
  }
}
```

**Explanation**:
- `for_each = var.environment_sg`: Terraform will loop over the `environment_sg` variable, which contains security group configurations for different environments.
- `each.value.description`: Each security group will have a unique description depending on the environment.
- `each.key`: This is the environment name (e.g., `dev`, `staging`, `prod`), which is used to generate security group names and tags.

**Output**:
Terraform will create three security groups, each configured differently based on the environment (dev, staging, prod), with unique ingress rules.

**Use Case**:
- **Pros**: Allows customization of each resource based on the environment.
- **Cons**: Requires more understanding of maps and resource management.

---

### **Example 4: Attaching Multiple EBS Volumes to EC2 Instances Using `count`**

#### Goal: Attach Identical EBS Volumes

**Scenario**:  
You need to attach multiple EBS volumes to a set of EC2 instances, where each instance gets a fixed number of identical EBS volumes.

**Explanation**:  
`count` is useful when creating a fixed number of identical EBS volumes for multiple EC2 instances. Here, you don’t need unique configurations for each EBS volume.

**Terraform Code**:

```hcl
variable "ebs_count" {
  default = 2
}

resource "aws_instance" "web" {
  count         = 3
  ami           = "ami-12345678"
  instance_type = "t2.micro"
}

resource "aws_ebs_volume" "ebs" {
  count      = var.ebs_count
  size       = 10
  availability_zone = aws_instance.web[0].availability_zone
}

resource "aws_volume_attachment" "ebs_attachment" {
  count        = var.ebs_count
  instance_id  = aws_instance.web[0].id
  volume_id    = aws_ebs_volume.ebs[count.index].id
  device_name  = "/dev/sdf${count.index}"
}
```

**Explanation**:
- `count = var.ebs_count`: This will create two EBS volumes.
- `aws_volume_attachment`: Attaches two EBS volumes to the first EC2 instance.

**Output**:
Terraform will provision three EC2 instances, and for each instance, two EBS volumes will be attached.

**Use Case**:
- **Pros**: Efficient when all instances need identical volumes.
- **Cons**: Limited flexibility if you need varying configurations for each volume.

---

### **Example 5: Combining `for_each` and `count` for EC2 Instances with EBS Volumes**

#### Goal: Provision EC2 Instances with Custom EBS Volumes

**Scenario**:  
You need to provision multiple EC2 instances, each with a unique set of EBS volumes. The number of volumes varies per instance.

**Explanation**:  
In this scenario, `for_each` is used to create EC2 instances, and `count` is used within the resource for attaching a different number of EBS volumes to each instance.

**Terraform Code**:

```hcl
variable "instances" {
  default = {
    instance1 = { ami = "ami-12345678", volume_count = 2 }
    instance2 = { ami = "ami-87654321", volume_count = 1 }
  }
}

resource "aws_instance" "web" {
  for_each = var.instances

  ami           = each.value.ami
  instance_type = "t2.micro"
  tags = {
    Name = each.key
  }
}

resource "aws_ebs_volume" "ebs" {
  count = length(var.instances[each.key].volume_count)

  size               = 10
  availability_zone  = aws_instance.web[each.key].availability_zone
}

resource "aws_volume_attachment" "attach" {
  count        = length(var.instances[each.key].volume_count)
  instance_id  = aws_instance

.web[each.key].id
  volume_id    = aws_ebs_volume.ebs[count.index].id
  device_name  = "/dev/sdf${count.index}"
}
```

**Explanation**:
- `for_each` iterates over a map of instances to provision EC2 instances.
- `count` is used to attach a variable number of EBS volumes to each instance based on its configuration.

**Output**:
Terraform creates two EC2 instances: one with two EBS volumes and another with one EBS volume.

**Use Case**:
- **Pros**: Combines flexibility and scalability.
- **Cons**: Slightly complex to implement, but powerful for dynamic environments.

---

These examples demonstrate different ways to use **`count`** and **`for_each`** in Terraform configurations, showcasing their strengths and the flexibility they offer when managing resources in various cloud environments.