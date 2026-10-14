locals {

  name_prefix = "${var.project_name}-${var.environment}"
  #if i call name-prefix it will give me sap-dev
  #you can use the same for named expression
  project_tag = {
    Project     = var.project_name
    Environment = var.environment
    ManagedBy   = "Kyn-dev-team01"
  }
}