resource "apstra_raw_json" "collector" {
  depends_on = [
    apstra_raw_json.service
  ]
  url = "/api/telemetry/collectors"
  id = "Loop_Detect_Schema"
  payload = jsonencode({
    service_name = "Loop_Detect_Schema",
    collectors = [
      {
        platform = {
          os_type = "junos",
          os_version =  "21.2r2",
          family = "junos,junos-ex,junos-qfx",
          model = ""
        },
        source_type = "cli",
        cli = "show loop-detect enhanced interface"
        query = {
          accessors = {
            LocalIF = "/loop-detect-enhanced-interface-information/loop-detect-enhanced-interface-entry/ld-interface-name",
            RemoteHost = "/loop-detect-enhanced-interface-information/loop-detect-enhanced-interface-entry/ld-remote-host",
            RemoteIF = "/loop-detect-enhanced-interface-information/loop-detect-enhanced-interface-entry/ld-remote-interface",
            value = "/loop-detect-enhanced-interface-information/loop-detect-enhanced-interface-entry/ld-interface-state"          },
          keys = {
            LocalIF = "LocalIF",
            RemoteHost = "RemoteHost",
            RemoteIF = "RemoteIF"
          },
          values = {
            value = "int(re_match('\\d+', value))"
          },
          filter = ""
        },
        relaxed_schema_validation = true
      }
    ],
  }
  )
}
