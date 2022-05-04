#################################
# Data Integratiojn permissions #
#################################
module "set_folder_iam_stocksplit" {
    source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

    folder_id = module.pj-stocksplit.folder_id
    bindings = {
        "user:patrick.van.heumen@hunkemoller.com" = var.bigquery_users,
        "user:remko.buijink@hunkemoller.com" = var.bigquery_users
    }
}

#######################
# Sandbox permissions #
#######################
module "set_folder_iam_jesper" {
    source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

    folder_id = google_folder.devoteam_jesper.name
    bindings = {
        "user:jesper.bergeskans@hunkemoller.com" = var.sandbox_roles
    }
}

module "set_folder_iam_phuong" {
    source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

    folder_id = google_folder.devoteam_phuong.name
    bindings = {
        "user:phuong.anh.nguyen@hunkemoller.com" = var.sandbox_roles
    }
}

module "set_folder_iam_bhakti_bagkar" {
    source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

    folder_id = google_folder.hkm_bhakti_bagkar.name
    bindings = {
        "user:bhakti.bagkar@hunkemoller.com" = var.sandbox_roles
    }
}

module "set_folder_iam_katharine_suwarso" {
    source = "git@github.com:hunkemollerbv/gcp-tf-modules.git//tf-gcp-modules-iam-folder/iam_folder_binding"

    folder_id = google_folder.hkm_katharine_suwarso.name
    bindings = {
        "user:katharine.suwarso@hunkemoller.com" = var.sandbox_roles
    }
}

# TODO: All these resources should be converted to using the iam_folder_binding
resource "google_folder_iam_member" "set_folder_iam_remko_buijink" {
    count = length(var.sandbox_roles)
    folder = google_folder.hkm_remko_buijink.name
    role = var.sandbox_roles[count.index]
    member = "user:remko.buijink@hunkemoller.com"
}

# resource "google_folder_iam_member" "set_folder_iam_bhakti_bagkar" {
#     count = length(var.sandbox_roles)
#     folder = google_folder.hkm_bhakti_bagkar.name
#     role = var.sandbox_roles[count.index]
#     member = "user:bhakti.bagkar@hunkemoller.com"
# }

resource "google_folder_iam_member" "set_folder_iam_dwan_thompson" {
    count = length(var.sandbox_roles)
    folder = google_folder.hkm_dwan_thompson.name
    role = var.sandbox_roles[count.index]
    member = "user:Dwan.Thompson@hunkemoller.com"
}

resource "google_folder_iam_member" "set_folder_iam_marko_lubina" {
    count = length(var.sandbox_roles)
    folder = google_folder.hkm_marko_lubina.name
    role = var.sandbox_roles[count.index]
    member = "user:marko.lubina@hunkemoller.com"
}

resource "google_folder_iam_member" "set_folder_iam_patrick_van_heumen" {
    count = length(var.sandbox_roles)
    folder = google_folder.hkm_patrick_van_heumen.name
    role = var.sandbox_roles[count.index]
    member = "user:patrick.van.heumen@hunkemoller.com"
}

resource "google_folder_iam_member" "set_folder_iam_tessa_van_den_bergh" {
    count = length(var.sandbox_roles)
    folder = google_folder.hkm_tessa_van_den_bergh.name
    role = var.sandbox_roles[count.index]
    member = "user:tessa.van.den.bergh@hunkemoller.com"
}

resource "google_folder_iam_member" "set_folder_iam_teus_van_ingen" {
    count = length(var.sandbox_roles)
    folder = google_folder.hkm_teus_van_ingen.name
    role = var.sandbox_roles[count.index]
    member = "user:teus.van.ingen@hunkemoller.com"
}