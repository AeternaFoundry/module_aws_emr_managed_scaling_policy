variable "emr_managed_scaling_policies" {
  description = <<EOT
Map of emr_managed_scaling_policies, attributes below
Required:
    - cluster_id
    - compute_limits (block):
        - maximum_capacity_units (required)
        - maximum_core_capacity_units (optional)
        - maximum_ondemand_capacity_units (optional)
        - minimum_capacity_units (required)
        - unit_type (required)
Optional:
    - region
    - scaling_strategy
    - utilization_performance_index
EOT

  type = map(object({
    cluster_id                    = string
    region                        = optional(string)
    scaling_strategy              = optional(string)
    utilization_performance_index = optional(number)
    compute_limits = list(object({
      maximum_capacity_units          = number
      maximum_core_capacity_units     = optional(number)
      maximum_ondemand_capacity_units = optional(number)
      minimum_capacity_units          = number
      unit_type                       = string
    }))
  }))
  validation {
    condition = alltrue([
      for k, v in var.emr_managed_scaling_policies : (
        length(v.compute_limits) >= 1
      )
    ])
    error_message = "Each compute_limits list must contain at least 1 items"
  }
  validation {
    condition = alltrue([
      for k, v in var.emr_managed_scaling_policies : (
        v.utilization_performance_index == null || (contains([1, 25, 50, 75, 100], v.utilization_performance_index))
      )
    ])
    error_message = "must be one of: 1, 25, 50, 75, 100"
  }
  # Note: 2 additional provider-side validators are enforced at apply time but not mirrored as validation{} blocks here (bespoke or non-mechanically-translatable).
}

