# ----------------------------------- #
# Setting bindings for data analysts  #
# ----------------------------------- #
module "data_analytics_set_folder_iam_data_marts" {
    source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

    folder_id = "folders/762689581202"
    bindings = {
        "group:gcp-data_analytics@hunkemoller.com" = var.bigquery_reader,
    }
}
