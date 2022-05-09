# -------------------------------- #
# Setting bindings for developers  #
# -------------------------------- #


module "developers_set_folder_iam_data_integration" {
    source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

    folder_id = google_folder.data_integration.name
    bindings = {
        "group:gcp-developers@hunkemoller.com" = ["roles/resourcemanager.folderViewer"],
    }
}

module "developers_set_folder_iam_oil" {
    source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

    folder_id = google_folder.oil.name
    bindings = {
        "group:gcp-developers@hunkemoller.com" = var.bigquery_reader,
    }
}

module "developers_set_folder_iam_sap_bw_to_bq" {
    source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

    folder_id = "folders/251505477721"
    bindings = {
        "group:gcp-developers@hunkemoller.com" = var.bigquery_reader,
    }
}

module "developers_set_folder_iam_people_counter" {
    source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

    folder_id = google_folder.people_counter.name
    bindings = {
        "group:gcp-developers@hunkemoller.com" = var.bigquery_reader,
    }
}

module "developers_set_folder_iam_stocksplit" {
    source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

    folder_id = module.pj-stocksplit.folder_id
    bindings = {
        "group:gcp-developers@hunkemoller.com" = var.bigquery_reader,
    }
}

module "developers_set_folder_iam_notificare" {
    source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

    folder_id = google_folder.notificare.name
    bindings = {
        "group:gcp-developers@hunkemoller.com" = var.bigquery_reader,
    }
}

module "developers_set_folder_iam_commerce_cloud" {
    source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

    folder_id = "folders/218592080829"
    bindings = {
        "group:gcp-developers@hunkemoller.com" = var.bigquery_reader,
    }
}

module "developers_set_folder_iam_service_cloud" {
    source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

    folder_id = google_folder.service_cloud.name
    bindings = {
        "group:gcp-developers@hunkemoller.com" = var.bigquery_reader,
    }
}

module "developers_set_folder_iam_selligent" {
    source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

    folder_id = module.pj-selligent.folder_id
    bindings = {
        "group:gcp-developers@hunkemoller.com" = var.bigquery_reader,
    }
}

module "developers_set_folder_iam_sap" {
    source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

    folder_id = google_folder.sap.name
    bindings = {
        "group:gcp-developers@hunkemoller.com" = var.bigquery_reader,
    }
}

module "developers_set_folder_iam_data_marts" {
    source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

    folder_id = "folders/762689581202"
    bindings = {
        "group:gcp-developers@hunkemoller.com" = var.bigquery_writer,
        "group:gcp-data_analytics@hunkemoller.com" = var.bigquery_reader,
    }
}

module "developers_set_project_selligent_datalake" {
    source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-project/iam_project_binding"

    project_id = "selligent-datalake"
    bindings = {
        "group:gcp-developers@hunkemoller.com" = var.bigquery_reader,
    }
}