output "asserts_prom_rule_files_id" {
  description = "Map of id values across all asserts_prom_rule_files, keyed the same as var.asserts_prom_rule_files except keys with no id are omitted"
  value       = { for k, v in grafana_asserts_prom_rule_file.asserts_prom_rule_files : k => v.id if v.id != null && length(v.id) > 0 }
}
output "asserts_prom_rule_files_active" {
  description = "Map of active values across all asserts_prom_rule_files, keyed the same as var.asserts_prom_rule_files except keys with no active are omitted"
  value       = { for k, v in grafana_asserts_prom_rule_file.asserts_prom_rule_files : k => v.active if v.active != null }
}
output "asserts_prom_rule_files_group" {
  description = "Map of group values across all asserts_prom_rule_files, keyed the same as var.asserts_prom_rule_files except keys with no group are omitted"
  value       = { for k, v in grafana_asserts_prom_rule_file.asserts_prom_rule_files : k => v.group if v.group != null && length(v.group) > 0 }
}
output "asserts_prom_rule_files_name" {
  description = "Map of name values across all asserts_prom_rule_files, keyed the same as var.asserts_prom_rule_files except keys with no name are omitted"
  value       = { for k, v in grafana_asserts_prom_rule_file.asserts_prom_rule_files : k => v.name if v.name != null && length(v.name) > 0 }
}

