output "emr_managed_scaling_policies_id" {
  description = "Map of id values across all emr_managed_scaling_policies, keyed the same as var.emr_managed_scaling_policies"
  value       = { for k, v in aws_emr_managed_scaling_policy.emr_managed_scaling_policies : k => v.id if v.id != null && length(v.id) > 0 }
}
output "emr_managed_scaling_policies_cluster_id" {
  description = "Map of cluster_id values across all emr_managed_scaling_policies, keyed the same as var.emr_managed_scaling_policies"
  value       = { for k, v in aws_emr_managed_scaling_policy.emr_managed_scaling_policies : k => v.cluster_id if v.cluster_id != null && length(v.cluster_id) > 0 }
}
output "emr_managed_scaling_policies_compute_limits" {
  description = "Map of compute_limits values across all emr_managed_scaling_policies, keyed the same as var.emr_managed_scaling_policies"
  value       = { for k, v in aws_emr_managed_scaling_policy.emr_managed_scaling_policies : k => v.compute_limits if v.compute_limits != null && length(v.compute_limits) > 0 }
}
output "emr_managed_scaling_policies_region" {
  description = "Map of region values across all emr_managed_scaling_policies, keyed the same as var.emr_managed_scaling_policies"
  value       = { for k, v in aws_emr_managed_scaling_policy.emr_managed_scaling_policies : k => v.region if v.region != null && length(v.region) > 0 }
}
output "emr_managed_scaling_policies_scaling_strategy" {
  description = "Map of scaling_strategy values across all emr_managed_scaling_policies, keyed the same as var.emr_managed_scaling_policies"
  value       = { for k, v in aws_emr_managed_scaling_policy.emr_managed_scaling_policies : k => v.scaling_strategy if v.scaling_strategy != null && length(v.scaling_strategy) > 0 }
}
output "emr_managed_scaling_policies_utilization_performance_index" {
  description = "Map of utilization_performance_index values across all emr_managed_scaling_policies, keyed the same as var.emr_managed_scaling_policies"
  value       = { for k, v in aws_emr_managed_scaling_policy.emr_managed_scaling_policies : k => v.utilization_performance_index if v.utilization_performance_index != null }
}

