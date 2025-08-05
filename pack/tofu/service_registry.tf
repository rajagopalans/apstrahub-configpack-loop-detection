resource "apstra_raw_json" "service" {
  depends_on = [
    apstra_datacenter_property_set.loop_detect_ps
  ]
  url = "/api/telemetry-service-registry"
  id = "Loop_Detect_Schema_${var.blueprint_id}"
  payload = jsonencode(
    {
      application_schema = {
        properties = {
          key = {
            properties = {
              LocalIF = {
                type : "string"
              },
              RemoteHost = {
                type : "string"
              }
              RemoteIF = {
                type : "string"
              }
            },
            required = [
              "LocalIF",
              "RemoteHost",
              "RemoteIF"
            ],
            type = "object"
          },
          value = {
            type = "string"
          }
        }
          required = [
            "key",
            "value"
          ],
          type = "object"
        },
        service_name = "Loop_Detect_Schema_${var.blueprint_id}",
        storage_schema_path = "aos.sdk.telemetry.schemas.iba_string_data",
        description = "Check the state of Lightweight Loop Detection on assigned interfaces"
      }
  )
}

