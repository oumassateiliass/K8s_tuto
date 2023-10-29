locals {
  users_eu2 =  [
      {
        user = "ioumassate"
        publickey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDYDNtFiKclSLEaVOZSZ4vQfAB69l3K8tYeK16zzpg+hiTmagiZvEGq8XB0Q46dvroMAbEzAVEayihwcjjcsNtNLNHjHjImx8mwE0a+62smM0UmjuyXOym1pdNsaWq0Gg7zSIlOj4j3AfWg1DQQ0d7gQ5lFqpncR2fDkfTywg9s/10p54bKcMSlOIMd5ihCmoRODs5d9aVyCmHrCBnxcryOwsacS/i5wcPmBNvyqb1lh9GICjD+xthi4TjTEbGf2sxXSkGP0Tqvp4GZ0IJlzJi080LTsopKl6K5iOUHZA0HPBuH+1JkMl9L2rFcBSnloVFZMYcCxZMMBNhdTDC6NpLAZNznMR9Vaan1g/pUtz4t9Z+vW4a6IbGZiwHRxAj66C48/4B4Aq70NXA4oWqAXb4mKF8xGlO24TPKwZOZuEvwQtwHnY/GHu9qQHiQ/zTYPB/JqU9LSKZvfeBZaY4fth5BamELd5gHm0UCfca0WRoFOsLzKnSQNX5VJG78YK3pYFs= oumassateiliass@cs-137429123549-default"
      },
       {
         user = "kkadioui"
         publickey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDYDNtFiKclSLEaVOZSZ4vQfAB69l3K8tYeK16zzpg+hiTmagiZvEGq8XB0Q46dvroMAbEzAVEayihwcjjcsNtNLNHjHjImx8mwE0a+62smM0UmjuyXOym1pdNsaWq0Gg7zSIlOj4j3AfWg1DQQ0d7gQ5lFqpncR2fDkfTywg9s/10p54bKcMSlOIMd5ihCmoRODs5d9aVyCmHrCBnxcryOwsacS/i5wcPmBNvyqb1lh9GICjD+xthi4TjTEbGf2sxXSkGP0Tqvp4GZ0IJlzJi080LTsopKl6K5iOUHZA0HPBuH+1JkMl9L2rFcBSnloVFZMYcCxZMMBNhdTDC6NpLAZNznMR9Vaan1g/pUtz4t9Z+vW4a6IbGZiwHRxAj66C48/4B4Aq70NXA4oWqAXb4mKF8xGlO24TPKwZOZuEvwQtwHnY/GHu9qQHiQ/zTYPB/JqU9LSKZvfeBZaY4fth5BamELd5gHm0UCfca0WRoFOsLzKnSQNX5VJG78YK3pYFs= oumassateiliass@cs-137429123549-default"
       }
  ]
}

resource "google_compute_instance" "kube_master_eu2" {
  for_each     = {for u in local.users_eu2: u.user => u}

  name         = "kube-${each.value.user}-master"
  machine_type = var.machine_type
  zone         = "us-west2-b"
  tags         = var.tags
  boot_disk {
    initialize_params {
      image = var.os
    }
  }
  network_interface {
    network    = google_compute_network.kube_network.id
    subnetwork = google_compute_subnetwork.kube_subnet_eu2.id
    access_config {}
  }
  metadata = {
    ssh-keys = join("\n", [for key in local.users_eu2 : "${key.user}:${key.publickey}"])
  }
}

resource "google_compute_instance" "kube_worker_eu2" {
  for_each     = {for u in local.users_eu2: u.user => u}

  name         = "kube-${each.value.user}-worker"
  machine_type = var.machine_type
  zone         = "us-west2-b"
  tags         = var.tags
  boot_disk {
    initialize_params {
      image = var.os
    }
  }
  network_interface {
    network    = google_compute_network.kube_network.id
    subnetwork = google_compute_subnetwork.kube_subnet_eu2.id
    access_config {}
  }
  metadata = {
    ssh-keys = join("\n", [for key in local.users_eu2 : "${key.user}:${key.publickey}"])
  }
}