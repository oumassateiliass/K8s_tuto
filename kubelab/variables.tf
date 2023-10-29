variable "project" {
  type        = string
  description = "GCP project name"
  default     = "test2-161022"
}

variable "region" {
  type        = string
  description = "GCP zone"
  default     = "us-west2"
}

variable "zone" {
  type        = string
  description = "GCP zone"
  default     = "us-west2-b"
}

variable "os" {
  type        = string
  description = "SKU for RHEL 8"
  default     = "debian-cloud/debian-11"
}

variable "machine_type" {
  type        = string
  description = "GCP machine type"
  default     = "e2-medium"
}

variable "tags" {
  type        = list(any)
  description = "GCP machine tags"
  default     = ["ssh", "http"]
}

variable "ip_cidr_range" {
  type        = string
  description = "GCP kube pod cidr"
  default     = "10.0.0.0/22"
}

variable "secondary_ip" {
  type        = string
  description = "GCP kube service cidr"
  default     = "172.16.0.0/24"
}

variable "clusters" {
  type        = list(any)
  description = "GCP machine tags"
  default     = ["ioumassate", "kkadioui"]
}

variable "users" {
  type        = list(map(string))
  description = "list of public ssh keys that have access to the VM"
  default = [
    {
      user      = "ioumassate"
      publickey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDYDNtFiKclSLEaVOZSZ4vQfAB69l3K8tYeK16zzpg+hiTmagiZvEGq8XB0Q46dvroMAbEzAVEayihwcjjcsNtNLNHjHjImx8mwE0a+62smM0UmjuyXOym1pdNsaWq0Gg7zSIlOj4j3AfWg1DQQ0d7gQ5lFqpncR2fDkfTywg9s/10p54bKcMSlOIMd5ihCmoRODs5d9aVyCmHrCBnxcryOwsacS/i5wcPmBNvyqb1lh9GICjD+xthi4TjTEbGf2sxXSkGP0Tqvp4GZ0IJlzJi080LTsopKl6K5iOUHZA0HPBuH+1JkMl9L2rFcBSnloVFZMYcCxZMMBNhdTDC6NpLAZNznMR9Vaan1g/pUtz4t9Z+vW4a6IbGZiwHRxAj66C48/4B4Aq70NXA4oWqAXb4mKF8xGlO24TPKwZOZuEvwQtwHnY/GHu9qQHiQ/zTYPB/JqU9LSKZvfeBZaY4fth5BamELd5gHm0UCfca0WRoFOsLzKnSQNX5VJG78YK3pYFs= oumassateiliass@cs-137429123549-default"
    },
    {
      user      = "kkadioui"
      publickey = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDYDNtFiKclSLEaVOZSZ4vQfAB69l3K8tYeK16zzpg+hiTmagiZvEGq8XB0Q46dvroMAbEzAVEayihwcjjcsNtNLNHjHjImx8mwE0a+62smM0UmjuyXOym1pdNsaWq0Gg7zSIlOj4j3AfWg1DQQ0d7gQ5lFqpncR2fDkfTywg9s/10p54bKcMSlOIMd5ihCmoRODs5d9aVyCmHrCBnxcryOwsacS/i5wcPmBNvyqb1lh9GICjD+xthi4TjTEbGf2sxXSkGP0Tqvp4GZ0IJlzJi080LTsopKl6K5iOUHZA0HPBuH+1JkMl9L2rFcBSnloVFZMYcCxZMMBNhdTDC6NpLAZNznMR9Vaan1g/pUtz4t9Z+vW4a6IbGZiwHRxAj66C48/4B4Aq70NXA4oWqAXb4mKF8xGlO24TPKwZOZuEvwQtwHnY/GHu9qQHiQ/zTYPB/JqU9LSKZvfeBZaY4fth5BamELd5gHm0UCfca0WRoFOsLzKnSQNX5VJG78YK3pYFs= oumassateiliass@cs-137429123549-default"
    }
  ]
}