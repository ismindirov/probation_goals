### 1. Meta-Argument: **`count`**

**Theory**:  
The `count` meta-argument allows you to specify how many instances of a resource or module Terraform should create. It's useful when you need to provision multiple identical resources. The `count` argument expects an integer value and creates that many copies of the resource or module.

**Advantages**:

- **Simplicity**: Easy to use when you need to create multiple instances of a resource.
- **Efficiency**: Can quickly scale up or down by adjusting the `count` value.

**Disadvantages**:

- **Less Flexibility**: Each instance is identical, and `count` does not allow assigning unique configurations easily.

**Practical Task**:  
**Objective**: Create multiple EC2 instances using the `count` meta-argument.

**Steps**:

1. Define a Terraform configuration that provisions EC2 instances.
2. Use the `count` argument to create three identical instances.
3. Apply the configuration.

```hcl
variable "instance_count" {
  default = 3
}

resource "aws_instance" "example" {
  count         = var.instance_count
  ami           = "ami-12345678"
  instance_type = "t2.micro"
  
  tags = {
    Name = "Instance ${count.index + 1}"
  }
}
```

**Definition of Done**: Terraform provisions three identical EC2 instances with unique tags like "Instance 1," "Instance 2," and "Instance 3."

---

### 2. Meta-Argument: **`for_each`**

**Theory**:  
The `for_each` meta-argument allows you to iterate over a collection (maps or sets) and create a resource or module instance for each item in the collection. This argument provides more flexibility than `count` by allowing unique configurations for each resource instance.

**Advantages**:

- **Flexibility**: Allows each resource to have its own unique attributes, even though they are created as part of the same resource block.
- **Control**: Useful when you need different configurations for different resources.

**Disadvantages**:

- **Slight Complexity**: A little more complex than `count` as it requires understanding collections (maps or sets) and using lookup functions.

**Practical Task**:  
**Objective**: Provision multiple S3 buckets using `for_each` with unique configurations.

**Steps**:

1. Define a map of S3 bucket configurations.
2. Use `for_each` to create a unique S3 bucket for each item in the map.
3. Apply the configuration.

```hcl
variable "bucket_names" {
  default = {
    bucket1 = "my-bucket-one"
    bucket2 = "my-bucket-two"
    bucket3 = "my-bucket-three"
  }
}

resource "aws_s3_bucket" "example" {
  for_each = var.bucket_names

  bucket = each.value
  acl    = "private"

  tags = {
    Name = each.key
  }
}
```

**Definition of Done**: Terraform creates three uniquely named S3 buckets based on the map values (`my-bucket-one`, `my-bucket-two`, `my-bucket-three`), with corresponding tags.

---

### 3. Difference Between **`count`** and **`for_each`**

**Theory**:  
While both `count` and `for_each` are meta-arguments that create multiple instances of resources, they are used in different scenarios:

- **`count`** is ideal when you want a fixed number of identical resources or modules.
- **`for_each`** is used when you need to create multiple resources with unique configurations based on elements of a map or set.

**Key Differences**:

- **Data Type**:
  - `count` accepts an integer and creates resources in a simple indexed list.
  - `for_each` accepts a map or set, creating uniquely identifiable resources.
- **Configuration**:
  - `count` creates identical resources.
  - `for_each` allows unique attributes for each resource.
- **Tracking Resources**:
  - `for_each` tracks resources by key, making it easier to manage changes in specific resources, while `count` tracks by position/index.

**Practical Task**:  
**Objective**: Compare `count` and `for_each` in a single Terraform configuration by creating resources with both.

**Steps**:

1. Use `count` to create identical EC2 instances.
2. Use `for_each` to create uniquely named S3 buckets.
3. Apply the configuration.

```hcl
variable "instance_count" {
  default = 2
}

resource "aws_instance" "example" {
  count         = var.instance_count
  ami           = "ami-12345678"
  instance_type = "t2.micro"

  tags = {
    Name = "Instance ${count.index + 1}"
  }
}

variable "bucket_names" {
  default = {
    bucket1 = "bucket-one"
    bucket2 = "bucket-two"
  }
}

resource "aws_s3_bucket" "example_bucket" {
  for_each = var.bucket_names

  bucket = each.value
  acl    = "private"

  tags = {
    Name = each.key
  }
}
```

**Definition of Done**: Terraform provisions two identical EC2 instances using `count` and two unique S3 buckets using `for_each`.
