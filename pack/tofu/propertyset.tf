#  Copyright (c) Juniper Networks, Inc., 2025-2025.
#  All rights reserved.
#  SPDX-License-Identifier: MIT
# change action to "laser-off", if you want to change the action to laser off

resource "apstra_property_set" "ps" {
  name = "Loop Detect ${data.apstra_datacenter_blueprint.bp.name}"
  data = jsonencode({
    loop_detect = {
      tx_int = "10s",
      revert_int = "120",
      vlan_id = "1320",
      action = "interface-down"
    }
  })
}

resource "apstra_datacenter_property_set" "loop_detect_ps" {
  blueprint_id = var.blueprint_id
  id           = apstra_property_set.ps.id
  sync_with_catalog = true
}
