# terraform-aws-ecs-service

## Instantiation
The simplest instantiation requires only an environment, container_name, app_name, capacity_provider_name, container_port,
ecs_cluster_id, target_group_arn, task_desired_count, subnets and security groups (both lists).

```
module "service" {
  source = "git@github.com:kiawnna/terraform-aws-ecs-service.git"

  container_name = "test container"
  app_name = "test app"
  capacity_provider_name = "capacity provider name"
  container_port = 8080
  ecs_cluster_id = "ecs cluster id"
  environment = "dev"
  target_group_arn = "target group arn"
  task_definition_arn = "task definition arn"
  task_desired_count = 1
  security_groups = ["security group id"]
  subnets = ["private subnet id"]
}
```
> This example will create an ECS service that accepts all the provided defaults. Review defaults below under Variables / Customizations.

## Resources Created
* An ECS service.

## Outputs
There are currently no outputs for this module.

## Variables / Customization
The variable below can be customized to fit your needs. The current defaults are:
>  * `capacity_provider_weight` &rarr; 1
>  * `health_check_grace_period` &rarr; 120
>  * `network_mode` &rarr; awsvpc
> > > This variable will be used only to determine if a network configuration block should be added to the resource.

See the `variables.tf` file for further information.

## Tags
Tags are automatically added to all resources where possible. Tags will have the following format:

```
tags = {
    Name = "${var.app_name}-${var.environment}-service"
    Deployment_Method = "terraform"
    Environment = var.environment
}
```

