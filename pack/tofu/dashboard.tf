resource "apstra_raw_json" "ddos_dashboard" {
  url = format("/api/blueprints/%s/iba/dashboards",var.blueprint_id)
  payload = jsonencode(
    {
      label = "Loop-detected Out",
      description = "",
      grid = [
      [
        {
          label       = "Loop-detected Out",
          description = "",
          type        = "stage",
          probe_id    = apstra_raw_json.probe.id,
          stage_name  = "Loop-detected Out",
          filter      = "",
          visible_columns = [
            "properties.system_id",
            "properties.LocalIF",
            "properties.RemoteHost",
            "properties.RemoteIF",
            "anomaly",
            "timestamp"
          ],
          orderby              = "",
          max_items            = 10,
          anomalous_only       = false,
          show_context         = false,
          spotlight_mode       = false,
          data_source          = "real_time",
          time_series_duration = 86400,
          aggregation_period   = 300,
          aggregation_type     = "unset",
          combine_graphs       = "none"
        }
        ]
      ],
      default = false,
      }
  )
}