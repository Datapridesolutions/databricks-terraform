locals {
  cluster_config = {
    cluster_name            = "${var.environment.code}-shared-cluster"
    spark_version           = "13.3.x-scala2.12"
    node_type_id            = "Standard_DS5_v2"
    autotermination_minutes = 60
    num_workers             = 10
  }
}

resource "databricks_cluster" "this" {
  count = var.enable_cluster ? 1 : 0
  cluster_name            = local.cluster_config.cluster_name
  spark_version           = local.cluster_config.spark_version
  node_type_id            = local.cluster_config.node_type_id
  autotermination_minutes = local.cluster_config.autotermination_minutes
  num_workers             = local.cluster_config.num_workers
  
  spark_conf = {
    "spark.databricks.cluster.profile" = "serverless"
    "spark.databricks.delta.preview.enabled" = "true"
  }
  custom_tags = {}
}