/**
 * Copyright 2024 Google LLC
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

locals {
  root_module_services = [
    "redis.googleapis.com"
  ]

  memcache_module_services = [
    "memcache.googleapis.com"
  ]

  redis-cluster_module_services = [
    "redis.googleapis.com"
  ]

  valkey_module_services = [
    "memorystore.googleapis.com"
  ]
}

module "project" {
  source  = "terraform-google-modules/project-factory/google"
  version = "~> 17.0"

  name                    = "ci-memory-store"
  random_project_id       = true
  org_id                  = var.org_id
  folder_id               = var.folder_id
  billing_account         = var.billing_account
  default_service_account = "delete"
  auto_create_network     = true

  activate_apis = [
    "cloudresourcemanager.googleapis.com",
    "serviceusage.googleapis.com",
    "redis.googleapis.com",
    "memcache.googleapis.com",
    "serviceconsumermanagement.googleapis.com",
    "networkconnectivity.googleapis.com",
    "compute.googleapis.com",
  ]
}


