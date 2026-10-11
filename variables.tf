variable "asserts_prom_rule_files" {
  description = <<EOT
Map of asserts_prom_rule_files, attributes below
Required:
    - name
    - group (block):
        - interval (optional)
        - name (required)
        - rule (required, block):
            - active (optional)
            - alert (optional)
            - annotations (optional)
            - disable_in_groups (optional)
            - duration (optional)
            - expr (required)
            - labels (optional)
            - record (optional)
Optional:
    - active
EOT

  type = map(object({
    name   = string
    active = optional(bool)
    group = list(object({
      interval = optional(string)
      name     = string
      rule = list(object({
        active            = optional(bool)
        alert             = optional(string)
        annotations       = optional(map(string))
        disable_in_groups = optional(set(string))
        duration          = optional(string)
        expr              = string
        labels            = optional(map(string))
        record            = optional(string)
      }))
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.asserts_prom_rule_files : (
        length(v.group) >= 1
      )
    ])
    error_message = "Each group list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.asserts_prom_rule_files : (
        alltrue([for item in v.group : (length(item.rule) >= 1)])
      )
    ])
    error_message = "Each rule list must contain at least 1 items"
  }
}

