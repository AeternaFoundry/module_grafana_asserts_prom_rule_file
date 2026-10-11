resource "grafana_asserts_prom_rule_file" "asserts_prom_rule_files" {
  for_each = var.asserts_prom_rule_files

  name   = each.value.name
  active = each.value.active

  dynamic "group" {
    for_each = each.value.group
    content {
      interval = group.value.interval
      name     = group.value.name
      dynamic "rule" {
        for_each = group.value.rule
        content {
          active            = rule.value.active
          alert             = rule.value.alert
          annotations       = rule.value.annotations
          disable_in_groups = rule.value.disable_in_groups
          duration          = rule.value.duration
          expr              = rule.value.expr
          labels            = rule.value.labels
          record            = rule.value.record
        }
      }
    }
  }
}

