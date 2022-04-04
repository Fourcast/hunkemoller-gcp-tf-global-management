terraform {
    required_version = ">=1.1.3"

    cloud {
        organization = "hunkemoller"
        workspaces {
            name = "gcp-tf-global-management"
        }
    }

    required_providers {
        tfe    = {
            source  = "hashicorp/tfe"
            version = "~> 0.25.0"
        }
        google = {
            source  = "hashicorp/google"
            version = "3.90.1"
        }
    }
}