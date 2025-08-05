resource "apstra_raw_json" "probe" {
  depends_on = [
 	apstra_raw_json.collector
 ]
  url = format("/api/blueprints/%s/probes",var.blueprint_id)
  payload   = <<-EOT
  {
      "label": "Loop Detect Status",
      "description": "",
      "processors": [
        {
          "name": "Loop Detect Status",
          "type": "extensible_data_collector",
          "properties": {
            "service_name": "Loop_Detect_Schema_${var.blueprint_id}",
            "service_interval": "120",
            "value_map": {},
            "graph_query": [
              "match(node('system', name='system', deploy_mode='deploy', role=is_in(['leaf', 'access'])))"
            ],
            "service_input": "''",
            "query_group_by": [],
            "keys": [],
            "ingestion_filter": {},
            "data_type": "dynamic",
            "query_tag_filter": {
              "filter": {},
              "operation": "and"
            },
            "execution_count": "-1",
            "system_id": "system.system_id",
            "query_expansion": {},
            "enable_streaming": false
          },
          "inputs": {},
          "outputs": {
            "out": "Loop Detect Status Out"
          }
        },
        {
          "name": "Loop-detected",
          "type": "match_string",
          "properties": {
            "raise_anomaly": true,
            "graph_query": [],
            "anomaly_retention_duration": 86400,
            "enable_streaming": false,
            "regexp": "\"Loop-detected\"",
            "anomaly_retention_size": 1073741824,
            "enable_anomaly_logging": true
          },
          "inputs": {
            "in": {
              "stage": "Loop Detect Status Out",
              "column": "value"
            }
          },
          "outputs": {
            "out": "Loop-detected Out"
          }
        }
      ],
      "stages": [
        {
          "name": "Loop Detect Status Out",
          "description": "",
          "units": {
            "value": ""
          },
          "enable_metric_logging": false,
          "retention_duration": 86400,
          "retention_size": 0,
          "graph_annotation_properties": {}
        },
        {
          "name": "Loop-detected Out",
          "description": "",
          "units": {
            "value": "Truth"
          },
          "enable_metric_logging": false,
          "retention_duration": 86400,
          "retention_size": 0,
          "graph_annotation_properties": {}
        }
      ]
    }
EOT
}
