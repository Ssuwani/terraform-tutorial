terraform {
  cloud {
    organization = "suwan"

    workspaces {
      name = "gh-actions"
    }
  }
}