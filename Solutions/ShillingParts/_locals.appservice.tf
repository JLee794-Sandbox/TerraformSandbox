locals {
  ###############################
  # Web App Configurations
  ###############################
  webapp_site_config = {
    application_stack = {
      dotnet_version   = try(var.dotnet_version, null)
      docker_image     = try(var.docker_image, null)
      docker_image_tag = try(var.docker_image_tag, null)
      java_server      = try(var.java_server, null)
      java_version     = try(var.java_version, null)
    }
  }
  ###############################
  # WebApp Logging and Backup
  ###############################
  webapp_logs = {
    name                = "logs"
    enabled             = true
    storage_account_key = "sa1"
    container_key       = "logs"

    sas_policy = {
      expire_in_days = 30
      rotation = {
        days = 30
      }
    }
    application_logs = {
      file_system_level = var.application_fs_level
      azure_blob_storage = {
        level             = var.application_log_level
        retention_in_days = var.application_log_retention_in_days
      }
    }
  }

  webapp_backup = {
    name                = "backup"
    enabled             = true
    storage_account_key = "sa1"
    container_key       = "backup"
    sas_policy = {
      expire_in_days = 30
      rotation = {
        days = 30
      }
    }
    schedule = {
      # Example of weekly backup
      frequency_interval       = 7
      frequency_unit           = "Day" # Day, Hour
      keep_at_least_one_backup = true
      retention_period_in_days = 30
      start_time               = timestamp()
    }
  }
}
