#  Copyright (c) Juniper Networks, Inc., 2025-2025.
#  All rights reserved.
#  SPDX-License-Identifier: MIT

resource "apstra_datacenter_configlet" "configlet" {
  depends_on = [
    apstra_datacenter_property_set.loop_detect_ps
  ]
  name = "Lightweight Loop Detection for Junos"
  generators = [
    {
      config_style = "junos",
      template_text = "protocols {\n    replace: loop-detect {\n        enhanced {\n{% for k, v in interface.items() %}\n    {% if v['role'] == 'l2edge' and v['part_of'] == '' and \n          loop_detect['vlan_id'] in v['allowed_vlans'] %}\n            interface {{ v['intfName'] }}.0 {\n                vlan-id {{ loop_detect['vlan_id'] }};\n                loop-detect-action loop_detect['action'] ;\n                transmit-interval {{ loop_detect['tx_int'] }};\n                revert-interval {{ loop_detect['revert_int'] }};\n            }\n    {% endif %}\n{% endfor %}\n        }\n    }\n}",
      section = "system",
    }
  ]
  blueprint_id = var.blueprint_id
  condition    = "role in [\"access\",\"leaf\"]"
}
