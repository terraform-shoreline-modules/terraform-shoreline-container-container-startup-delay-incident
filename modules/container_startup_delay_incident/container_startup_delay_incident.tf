resource "shoreline_notebook" "container_startup_delay_incident" {
  name       = "container_startup_delay_incident"
  data       = file("${path.module}/data/container_startup_delay_incident.json")
  depends_on = [shoreline_action.invoke_update_container_limits]
}

resource "shoreline_file" "update_container_limits" {
  name             = "update_container_limits"
  input_file       = "${path.module}/data/update_container_limits.sh"
  md5              = filemd5("${path.module}/data/update_container_limits.sh")
  description      = "Increase the resources available to the container, such as CPU or memory, to help it start up more quickly."
  destination_path = "/tmp/update_container_limits.sh"
  resource_query   = "host"
  enabled          = true
}

resource "shoreline_action" "invoke_update_container_limits" {
  name        = "invoke_update_container_limits"
  description = "Increase the resources available to the container, such as CPU or memory, to help it start up more quickly."
  command     = "`chmod +x /tmp/update_container_limits.sh && /tmp/update_container_limits.sh`"
  params      = ["CONTAINER_NAME","NEW_CPU_LIMIT","NEW_MEMORY_LIMIT"]
  file_deps   = ["update_container_limits"]
  enabled     = true
  depends_on  = [shoreline_file.update_container_limits]
}

