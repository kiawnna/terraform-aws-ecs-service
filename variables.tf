variable "environment" {
  type = string
}
variable "app_name" {
  type = string
}
variable "ecs_cluster_id" {
  type = string
}
variable "task_definition_arn" {
  type = string
}
variable "task_desired_count" {
  type = string
}
variable "target_group_arn" {
  type = string
}
variable "container_port" {
  type = number
}
variable "capacity_provider_name" {
  type = string
}
variable "capacity_provider_weight" {
  type = number
  default = 1
}
variable "health_check_grace_period" {
  type = number
  default = 120
}
variable "container_name" {
  type = string
}
variable "network_mode" {
  type = string
  default = "awsvpc"
}
variable "subnets" {
  type = list(string)
}
variable "security_groups" {
  type = list(string)
}