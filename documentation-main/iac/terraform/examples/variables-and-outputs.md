# Variables
  ```hcl
    variable "string_var" {
      type    = string
      default = "default_value"
    }

    variable "number_var" {
      type    = number
      default = 42
    }

    variable "bool_var" {
      type    = bool
      default = true
    }

    variable "list_var" {
      type    = list(string)
      default = ["item1", "item2", "item3"]
    }

    variable "map_var" {
      type = map(string)
      default = {
        key1 = "value1"
        key2 = "value2"
      }
    }

    variable "object_var" {
      type = object({
        attr1 = string
        attr2 = number
      })
      default = {
        attr1 = "value"
        attr2 = 123
      }
    }

    variable "tuple_var" {
      type = tuple([string, number, bool])
      default = ["item1", 42, true]
    }
  ```

# Outputs
```hcl
  output "string_output" {
    value = var.string_var
  }

  output "formatted_string" {
    value = format("The value of string_var is: %s", var.string_var)
  }

  output "number_output" {
    value = var.number_var
  }

  output "list_output" {
    value = var.list_var
  }

  output "joined_list" {
    value = join(", ", var.list_var)
  }

  output "split_string" {
    value = split(",", "item1,item2,item3")
  }

  output "list_length" {
    value = length(var.list_var)
  }

  output "map_output" {
    value = var.map_var
  }

  output "merged_map" {
    value = merge(var.map_var, {key3 = "value3"})
  }

  output "object_output" {
    value = var.object_var
  }

  output "tuple_output" {
    value = var.tuple_var
  }

  output "formatted_tuple" {
    value = format("Tuple values are: %s, %d, %t", var.tuple_var[0], var.tuple_var[1], var.tuple_var[2])
  }
```