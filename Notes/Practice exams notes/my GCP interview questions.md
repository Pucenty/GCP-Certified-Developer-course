my GCP interview questions



## Cloud advantages over on premise

better use resources
custom
scalability
helps with 

how to reduce latecy further
buckets
reduce database querries
HTTP2
Latency tracking tool
Trace



## GCP advantages over other cloud providers

- Superior fast network, a great amount of datacenters around the world
- GKE: Managed control plane
- generous free tier: first 50 GM of logs is free, one compute instance free
- Integrated and managed Cloud Service Mesh

What is Cloud Service Mesh?

Cloud Service Mesh is Google's solution for both Google Cloud and supported GKE Enterprise environments.

    On Google Cloud: Cloud Service Mesh provides APIs that are specific to the computing infrastructure on which your workloads run.
        For Compute Engine workloads, Cloud Service Mesh uses Google Cloud-specific service routing APIs.
        For Google Kubernetes Engine (GKE) workloads, Cloud Service Mesh uses the open source Istio APIs.
    Off Google Cloud: With Distributed Cloud or GKE multicloud, Cloud Service Mesh supports the Istio APIs for Kubernetes workloads.

Whether on or off Google Cloud, Cloud Service Mesh lets you manage, observe, and secure your services without having to change your application code.

Cloud Service Mesh reduces the toil for your operations and development teams by simplifying service delivery, from traffic management and mesh telemetry to securing communications between services. Google's fully managed service mesh lets you manage complex environments and enjoy the benefits they promise.


## STORAGE

1. What storage clasees are availiable in GCP?
STANDARD
NEARLINE
COLDLINE
ARCHIVE
autoclass

2. Can you automatically change storage class of an object in the bucket from one to another?
Object Lifecycle Management
To support common use cases like setting a Time to Live (TTL) for objects, retaining noncurrent versions of objects, or "downgrading" storage classes of objects to help manage costs, Cloud Storage offers the Object Lifecycle Management feature.

2. what are safety measures GCP provides to make sure your data is dafe in case of a data center failure or accidental deletion?

The availability of Standard storage data is:
Location Type 	Availability SLA1 	Typical monthly availability
multi-region 	99.95% 	>99.99%
dual-region 	99.95% 	>99.99%
region 	99.9% 	99.99%


- soft-delete - you can restore the object for next 7 days
- versioning - when deleting, a version of an object becomes unconcurrent





## VPC

- What is a VPC?
Virtual Private Cloud (VPC) provides networking functionality to Compute Engine virtual machine (VM) instances, Google Kubernetes Engine (GKE) clusters, and serverless workloads.
Remember, a VPC in GCP is cross-region and all subnets can communicate by default. GCP introduces the concept of a project. A VPC is part of a project, subnets internal to the VPC can communicate, but they can't communicate with a VPC in another project.

VPC is global
communicate privatly without public internet
can increase subnet range on demand

- When creating a project how many subnets are created?
One in every region

- What are VPC creation modes? deafult and custom


## Shared VPC vs VPC peering

- What is a shared VPC?

Shared VPC allows an organization to connect resources from multiple projects to a common Virtual Private Cloud (VPC) network so that they can communicate with each other securely and efficiently by using internal IP addresses from that network.

- What other option do you have in GCP to share resources across projects?
VPC Network Peering
Google Cloud VPC Network Peering connects two Virtual Private Cloud (VPC) networks so that resources in each network can communicate with each other. Peered VPC networks can be in the same project, different projects of the same organization, or different projects of different organizations.

- What are the differences between Shared VPC and VPC Peering

## MIGs

- What is a Managed Instance Group?

A MIG is a collection of virtual machine (VM) instances that you can manage as a single entity.

- What are the advantages of using MIG?
MIGs support features such as autohealing, autoscaling, load balancing, multiple zone coverage, and stateful workloads. Each VM in a MIG is based on an instance template.

- How to create a managed instance group?

- What is the difference of managed vs unmanaged instace group?
Ulike managed instance groups, unmanaged instance groups are just collections of distinct VMs that do not share a common instance template. You simply create a group, and add individual VMs to the group.
Why use Unmanaged Groups at all?

If you need to included instances from different families, this is your only option. You would not get autoscaling or multizonal deployments - but you can still use this group together as a backend for a loadbalancer.

## NETWORKING


- Do you have experience setting up proxies? How would you proxy traffic from one VPC into another?
- If you wanted to proxy traffic from one VPC into antoher how would you approach it?

## LOADBALANCERS

- What types of Loadbalancers are availiable in GCP


## IAM impers


## Firewall

- How firewall rules work in GCP?
Applied at a VM level, tag added to VM, service account etc.
- When you create a project in GCP. By default what traffic is allowed?
All ingrees is allowed, all egress is blocked

- What are routes?
Google Cloud routes define the paths that network traffic takes from a virtual machine (VM) instance to other destinations.

- Costs of network traffic in GCP?

all ingress traffic is free in most cases, egress paid when moving data between zones or regions


## Monitoring

How to measure number of user currently using the application? Custom metrics


## Containers/DOCKER

1. How container differ from VMs?
2. What are the advantages of conternerizing apps?
- Portability: One of the main advantages of using containers is that they are highly portable. Containers are designed to be platform-independent and can be run on any system that supports the container runtime. This makes it easy to move applications between different environments, from development to test to production, without reconfiguring the setting.

- Scalability: Containers are lightweight and fast, so they can be quickly spun up or down as needed. Depending on demand, scaling applications up or down is accessible. Container orchestration tools, such as Kubernetes, make it easy to manage large numbers of containers and automate the scaling process

- Isolation: Containers provide high isolation between applications and their dependencies. Each container runs in its environment, with its file system, network stack, and processes. This makes running multiple applications on the same host easy without worrying about conflicts or dependencies.

- Consistency: Containers provide a consistent runtime environment for applications, regardless of the underlying system. This means developers can be confident that their code will run the same way on any system supporting the container runtime.

- Resource efficiency: Containers are lightweight and share the host system’s resources. This means multiple containers can run on the same host without consuming many resources. This makes running more applications on the same hardware possible, reducing costs.

3. When you shouldn't contenerize the app or what types of applications you shouldn't Dockerize?

- Monolyth applications
- desktop applications
- Docker speeds up development process - not worth it if dev team consists only of one dev
- If your application relies heavily on persistent data
- Same goes for databases: Running databases with valuable data in Docker is known to cause problems in previous times.


DOCKERFILE

FROM <image>    ubuntu:18:04     Defines a base for your image.
WORKDIR <directory>	/app     Sets the working directory for any RUN, CMD, ENTRYPOINT, COPY, and ADD instructions that follow it in the Dockerfile.
COPY <src> <dest>   your_app_script.py to working dir 	Copies new files or directories from <src> and adds them to the filesystem of the container at the path <dest>.
RUN <command>   apt update && apt install python3	Executes any commands in a new layer on top of the current image and commits the result. RUN also has a shell form for running commands.
CMD <command>   ["python", "my_script.py"] (argumenty w CMD są opcjonalne i mogą być pominięye, natomiast przy ENTRYPOINT wykonują się zawsze)  	Lets you define the default program that is run once you start the container based on this image. Each Dockerfile only has one CMD, and only the last CMD instance is respected when multiple exist.


What does EXPOSE mean in a Dockerfile?

CMD vs ENTRYPOINT, what's the difference?

RUN stanza vs CMD/ENTRYPOINT - one runs at build time, the other one when container is launched



How containers communicate within a Pod:

    Shared Network Namespace: Containers in the same Pod share the same IP address and network ports. They can communicate with each other using localhost, as they are all part of the same network namespace.

    Inter-Container Communication:
        Containers can communicate over TCP or UDP using localhost and the ports exposed by each container. For example, if container A listens on port 8080, container B can communicate with it by sending requests to http://localhost:8080.

    Shared Storage: If containers need to share data, they can also use shared volumes (like EmptyDir or PersistentVolumes). This allows them to read and write to the same file system level.

    Environment Variables: Kubernetes can inject environment variables into containers that may contain settings or configuration values, which can help facilitate communication.

    Lifecycle Links: Containers in a Pod can also share lifecycle hooks (like readiness or startup probes) to communicate their status or readiness for handling traffic.



- Do you have to rebuild container to change code running inside container?
You can use volumes/bind mounts edit code live inside running container



## DOCKER COMPOSE

Configures containers on the same host. Enables services that allow running and managing replicas of containers.

- Docker Compose vs Docker Swarm

Docker Swarm is a orchestration tool, that distributes stacks (deployments in K8) into swarm nodes with 'docker stack deploy' command. Takes configuration in yaml as deployment in Kubernetes.

## KUBERNETES/DOCKER SWARM


- What are key components of Kubernetes
- Describe what each of them does
- Describe Kubernetes networking model
- What happens if the network plugin is not installed, what state would nodes go in
- How to add custom notes to deployment history to Kubernetes: kubectl annotate deployment nginx kubernetes.io/change-cause="version change to 1.16.0 to latest" --overwrite=true

- What deployment strategies are availiable in Kubernetes?


In this article, you will learn about the following Kubernetes deployment strategies:

    Rolling deployment—the default strategy that allows you to update a set of pods without downtime. It replaces pods running the old version of the application with the new version, one by one.
    Recreate deployment—an all-or-nothing method that lets you update an application instantly, with some downtime. It terminates all pods and replaces them with the new version.
    Ramped slow rollout—rolls out replicas of the new version, while in parallel, shutting down old replicas. 
    Best-effort controlled rollout—specifies a “max unavailable” parameter which indicates what percentage of existing pods can be unavailable during the upgrade, enabling the rollout to happen much more quickly.
    Blue/green deployment—a deployment strategy in which you create two separate, but identical environments, and over to the new environment.
    Canary deployment—uses a progressive delivery approach, with one version of the application serving most users, and another, newer version serving a small pool of test users. The test deployment is rolled out to more users if it is successful.
    Shadow deployment—the new version of the application (the “shadow” version) receives real-world traffic alongside the current version, but without affecting end-users.
    A/B testing—rolls out two or more versions of an application feature to a subset of users simultaneously to see which one performs better in terms of user engagement, error rates, or other KPIs.


- By default Kubernetes uses default compute engine SA. What can you do to fine-grain permissions for Kubernetes

- How to autoscale cluster based on a custom metric?

Set Up Custom Metrics:

    First, ensure that your application exposes custom metrics. You can use tools like Prometheus, Stackdriver (now part of Google Cloud Monitoring), or other monitoring tools to export your custom metrics.

Integrate with Google Cloud Monitoring:

    Use Cloud Monitoring to view and analyze the custom metrics.
    Make sure the metrics are available in Cloud Monitoring and that they have the correct labels and format for autoscaling.

Configure Custom Metrics in Kubernetes:

    Install the Kubernetes Metrics Server if it's not already set up, as HPA relies on this.
    Use the Custom Metrics Adapter for interacting with Cloud Monitoring APIs. This allows Kubernetes HPA to access your custom metrics.

Deploy and Configure HPA:

    Define an HPA resource in your Kubernetes cluster that uses the custom metric.

    Here's an example YAML configuration for an HPA:
    yaml

        apiVersion: autoscaling/v2beta2
        kind: HorizontalPodAutoscaler
        metadata:
          name: custom-metric-hpa
        spec:
          scaleTargetRef:
            apiVersion: apps/v1
            kind: Deployment
            name: your-deployment-name
          minReplicas: 1
          maxReplicas: 10
          metrics:
          - type: External
            external:
              metric:
                name: custom.googleapis.com|your_metric_name
              target:
                type: AverageValue
                averageValue: 100

        Replace "custom.googleapis.com|your_metric_name" with the actual path of your custom metric in Cloud Monitoring.

    Deploy the HPA:
        Apply the HPA configuration to your cluster using kubectl apply -f hpa-config.yaml.

    Monitor and Adjust:
        Monitor the behavior of your application and adjust the HPA configuration as needed to ensure it scales effectively.

Using Instance Group Manager for VMs

For VM-based workloads, you'll use an Instance Group Manager that scales based on custom metrics:

    Create a Custom Metric:
        As before, create and export your custom metric to Cloud Monitoring.

    Create Instance Group and Autoscaler:
        Set up an instance group in your project.
        Use the GCP console or gcloud command to create an autoscaler associated with the instance group.

    Define Autoscaling Policy:
        Configure the autoscaler's policy to use your custom metric.
        In the console, go to your Instance Group, click "Edit", and configure the autoscaling policy to use a "Monitoring metric".

    Specify Custom Metric and Target Utilization:
        Select the custom metric and define the utilization target for the metric.


- What is a headless service and what it's purpose?
It is used for discovering individual pods(especially IPs) which allows another service to interact directly with the Pods instead of a proxy
- Service types and differences?
NodePort, LoadBalancer, ExternalName, and ClusterIP


Should I deploy one microservice per pod or per container?
Best: one microservice per pod and one container per pod to easily autoscale each microservice. They can be deployed/updated independently.
Exceptions: helper containers that assist main container, data pullers, data pushers and proxies

This is a great question about Kubernetes architecture and microservices deployment. The general best practice is to deploy one microservice per container, and typically one container per pod. Here's why:

    One microservice per container:
        Promotes separation of concerns
        Allows for independent scaling of services
        Simplifies updates and rollbacks
        Improves resource allocation and utilization
        Enhances isolation and security

    One container per pod (in most cases):
        Simplifies pod management and scheduling
        Makes it easier to monitor and debug individual services
        Allows for more granular control over resource allocation
        Facilitates independent scaling of services

However, there are some scenarios where you might consider multiple containers in a pod:

    Sidecar pattern: When you need a helper container to support the main container (e.g., log shippers, proxies)
    Ambassador pattern: For handling network connections for the main container
    Adapter pattern: To standardize and normalize output from the main container

Reasons to avoid multiple microservices per pod:

    Scaling becomes more complex
    Harder to manage dependencies between services
    Potential resource conflicts
    Complicates monitoring and logging
    Makes updates and rollbacks more challenging

In summary, while there are exceptions, the general recommendation is to deploy one microservice per container and one container per pod. This approach aligns well with microservices architecture principles and Kubernetes' design philosophy, offering the best balance of simplicity, flexibility, and manageability.




Difference between liveness and readiness probe?


## HELM

Explain the difference between `helm install`, `helm upgrade`, and `helm rollback` commands in Helm, and when would you use each of them?

- `helm install` is used to initially deploy a chart.
— `helm upgrade` is used to update an existing deployment with new chart versions or configuration changes.
— `helm rollback` is used to revert to a previous release in case of issues or failures.

## GCP Serverless

- If you want your app to be serverless, what options do you have in GCP?

App Engine
Cloud Functions


Cloud Run vs GKE



## CloudSQL

?

## LOGS

1. In GCP what factors contribute to overall logging charge?

Logging costs:

- Logging storage*: 	$0.50/GiB;
One-time charge for streaming logs into log bucket storage for indexing, querying, and analysis; includes up to 30 days of storage in log buckets. No additional charges for querying and analyzing log data. 

- Logging retention†: $0.01 per GiB per month for logs retained more than 30 days; billed monthly according to retention. 	Logs retained for the default retention period don't incur a retention cost.

2. How would you reduce logging costs in GCP?

- reduce number of logs gathered
- reduce log verbosity level
- switch to metrics if possible i.e. many requests per second, error rates
- set exclusion filters - You can limit the amount of log data that is ingested by excluding certain log entries
- route to cheeper storage class bucket
- Turn off log ingestion for some log types

2. You are a DevOps engineer for a social media company. You are on the monitoring team for their flagship web application that is growing rapidly. The application is deployed on Managed Instance Groups behind a HTTP(S) load balancer. The number of logs created by the application is causing the Project to exceed the logging API quota. You have created exclusion filters in Cloud Logging. You notice the issue persists.

What could be the problem?

C. Logs are excluded after they are received by the Logging API. Therefore, excluding logs does not reduce the number of entries.write API calls. BAD

3. Do you know any log types in GCP? What are two default buckets where logs are stored


Setting up all things from scratch

Did you create
Creating ingress


AWS




Log types:

- Admin Activity audit logs
- Data Access audit logs
- System Event audit logs

- Policy Denied audit logs
- Firewall logs
- VPC Flow logs
- load balancer logs



_Required log bucket

Cloud Logging automatically routes the following types of log entries to the _Required bucket:

    Admin Activity audit logs - Contains log entries for API calls or other administrative actions that modify the configuration or metadata of resources.
    System Event audit logs (disabled by default) - Contains API calls that read the configuration or metadata of resources, including user-driven API calls that create, modify, or read user-provided resource data.
    Google Workspace Admin Audit logs - Contains log entries for administrative actions taken by Google Cloud that modify the configuration of resources.
    Enterprise Groups Audit logs (generated by default) - Contains logs when a Google Cloud service denies access to a user or service account triggered by a security policy violation.
    Login Audit logs
    Access Transparency logs. For information about enabling Access Transparency logs, see the Access Transparency logs documentation.

Cloud Logging retains the log entries in the _Required bucket for 400 days; you can't change this retention period.

You can't modify or delete the _Required bucket. You can't disable the _Required sink, which routes log entries to the _Required bucket.


_Default log bucket

Any log entry that isn't stored in the _Required bucket is routed by the _Default sink to the _Default bucket, unless you disable or otherwise edit the _Default sink. For instructions on modifying sinks, see Manage sinks.

For example, Cloud Logging automatically routes the following types of log entries to the _Default bucket:

    Data Access audit logs (enabled for BiqQuery only by default) - Data Access audit logs are stored in the _Default bucket unless you've routed them elsewhere 
    Policy Denied audit logs (cannot be disabled)

Cloud Logging retains the log entries in the _Default bucket for 30 days, unless you configure custom retention for the bucket.



## Pub/Sub

Types of subscriptions

When you create a subscription, you must specify the type of message delivery. Pub/Sub offers the following types of subscriptions:

    Pull subscriptions use a subscriber client to request messages from the Pub/Sub server.

    Push subscriptions use the Pub/Sub server to initiate requests to your subscriber application to deliver messages.

    Export subscriptions help you export your messages directly to a Google Cloud resource. These subscriptions include the following:

        BigQuery subscriptions export data to a BigQuery table.

        Cloud Storage subscriptions export data to a Cloud Storage bucket.


## Ansible GOOD

- How does Ansible communicate with agents?
Over SSH, no agents needed





- What is Ansible inventory?
All the machines you’re using with Ansible (the control machine plus nodes) are listed in a single simple file, along with their IP addresses, databases, servers, and so on. Once you register the inventory, you can assign variables to any of the hosts using a simple text file. You can also pull inventory from sources like EC2 (Amazon Elastic Compute Cloud).

- What is Ansible Tower?

Ansible Tower is Red Hat’s commercial web-based solution for managing Ansible. Its best-known feature is an easy-to-use UI (user interface) for managing configurations and deployments, which is a significant improvement over the original UI. Ansible Tower contains the essential features of Ansible, especially those that are easier to see in a graphical format rather than a text-based format.


-  Describe how Ansible works.

This is one of the most frequently asked ansible interview questions where the interviewer wants to know whether you actually know the tool in and out or not. You can start this way - ansible is broken down into two types of servers: controlling machines and nodes. Ansible is installed on the controlling computer, and the controlling machines manage the nodes via SSH. 

The controlling machine contains an inventory file that holds the node system’s location. Ansible runs the playbook on the controlling machine to deploy the modules on the node systems. Since Ansible is agentless, there’s no need for a third-party tool to connect the nodes.


- Explain what a “playbook” is.

A playbook has a series of YAML-based files that send commands to remote computers via scripts. Developers can configure entire complex environments by passing a script to the required systems rather than using individual commands to configure computers from the command line remotely. Playbooks are one of Ansible’s strongest selling points and often referred to as the tool’s building blocks.


Advanced

- What’s a handler?

In Ansible, a handler is similar to a regular task in a playbook, but it will only run if a task alerts the handler. Handlers are automatically loaded by roles/<role_name>/handlers/main.yaml. Handlers will run once, after all of the tasks are completed in a particular play.

- Explain the difference between a playbook and a play.

A play is a set of tasks that run on one or more managed hosts. Plays consist of one or more tasks. A playbook consists of one or more plays.

- How do you keep data secret in a playbook?

If you want to keep secret data but still be able to share it publicly, then use Vault in playbooks. 




Any certificates?

What are routes


Biggest struggles

routes firect traffic from subnet

ingress traffic

How to create a proxy?

routes not




## TERRAFORM

- If you wanted to provision a GKE cluster with Terraform, what resources would you need?

In here, you will find four files used to provision a VPC, subnets and a GKE cluster.

    vpc.tf provisions a VPC and subnet. A new VPC is created for this tutorial so it doesn't impact your existing cloud environment and resources. This file outputs region.

    gke.tf provisions a GKE cluster and a separately managed node pool (recommended). Separately managed node pools allows you to customize your Kubernetes cluster profile — this is useful if some Pods require more resources than others. You can learn more here. The number of nodes in the node pool is defined also defined here.

    terraform.tfvars is a template for the project_id and region variables.

    versions.tf sets the Terraform version to at least 0.14.


- What is the purpose of Terraform modules?



    Reusability: Modules encapsulate configuration files that define common infrastructure components, like a virtual network or a set of virtual machines, allowing you to reuse them across different projects or environments. This reduces the need to write the same code repeatedly.

    Organizational Structure: Modules provide a way to organize your configuration into smaller, manageable code segments. This improves code readability and maintainability by separating different components of your infrastructure.

    Abstraction: By using modules, you can abstract complex infrastructure logic behind a simplified interface. This is beneficial for users who might need to manage infrastructure without understanding every detail of the underlying setup.

    Consistency: Modules help ensure that infrastructure setups are consistent across different environments (e.g., development, staging, production) by using the same module with different inputs.

    Collaboration: Modules encourage collaboration among teams by sharing infrastructure as code. Teams can contribute to module development and improvements, creating a shared repository of best practices.

    Versioning and Control: By organizing infrastructure into modules, you can version control these collections for easier rollback and change management. This is especially beneficial in large-scale environments where infrastructure components need rigorous change control.

You can source modules

- What is the purpose of Terraform outputs

Outputs: 

Outputs defined to expose values from the module, making them accessible to the calling configuration, other tools, to output some useful info to user i.e. IP address of deployed resource, they are useful for debugging, they are stored in the state as well

- How to secure TF state file



- Account impersonation?

Pros:

Service account impersonation is useful when you need to do tasks like the following:

    Grant a user temporary elevated access
    Test whether a specific set of permissions is sufficient for a task
    Locally develop applications that can only run as a service account
    Authenticate external applications

    Can use short lived tokens instead of using creds

Cons:

    Harder to audit (SA showing instead of the actual principal)


- depends on

- during plan Terraform detected changes to infra. You didn't change anything. What may be the reason?



- How to make make sure no secrets are displayed in a Terraform state?

Use sensitive attribute so it's not displayed in terraform plan/apply output

Encrypt with Hashicorp Vault

Use remote state with encryption.

Use null resource to run scripts that handle sensitive data outside Terraform configuration



- Best practices for managing your Terraform code?




    Use Version Control: 
        Store your Terraform configuration files in a version control system like Git. This provides a history of changes and facilitates collaboration through features like branching and pull requests.

    Organize Configuration: 
        Structure your Terraform configuration using directories and modules. Group related resources, and use modules to encapsulate common setups and promote reusability.

    State Management: 
        Use remote backends for storing your Terraform state. This ensures that state files are securely stored and accessible for collaboration. Backends like AWS S3, Terraform Cloud, or HashiCorp Consul are popular choices.

    Environment Segregation:
        Use separate state files for different environments (e.g., development, staging, production) to prevent accidental changes impacting the wrong environment. Organize configurations by placing them in separate directories for each environment.

    Variable Usage:
        Define variables in variables.tf files to allow for dynamic and configurable infrastructure setups. Use environment-specific variable files, and consider using a naming convention for consistency.

    Output Utilization:
        Use outputs to expose important attributes of your infrastructure. This helps other modules or external systems consume necessary information, like IP addresses or resource IDs.

    Maintain Security:
        Keep sensitive data, such as credentials and private keys, out of your Terraform files and state. Utilize secrets management solutions like AWS Secrets Manager or HashiCorp Vault to inject sensitive data at runtime.

    Validation and Formatting:
        Use terraform fmt to format your code consistently and terraform validate to check for errors before applying changes. These steps help maintain code readability and catch errors early.

    Implement CI/CD:
        Automate Terraform operations with continuous integration/continuous deployment (CI/CD) pipelines. Incorporate tests, such as terraform plan, to review changes before they are applied to catch potential issues.

    Documentation:
        Document your configurations and infrastructure design. Use comments within Terraform files for clarity and maintain separate documentation for architecture overviews and process guides.

    Resource Naming Conventions:
        Follow consistent naming conventions for resources, variables, and modules to make the code self-explanatory and easier to navigate.

    Lock and Limit Versions:
        Use required_version in your terraform block to specify compatible Terraform versions. Similarly, specify provider versions to prevent unexpected updates from breaking configurations.


Advanced 

- what coallesce does?


- When to use null resource?


In Terraform, the null_resource is used when you need to perform actions that don't fit the traditional lifecycle of an infrastructure resource. Some common scenarios where null_resource is helpful include:

    Provisioners without Resource Dependency: When you want to use provisioners (like local-exec or remote-exec) but don't have a specific resource to attach them to. This can be useful for running custom scripts or commands.

    Triggering Actions on Changes: Use the triggers argument to define arbitrary values that the null_resource should consider when determining if it needs to be recreated. This is useful for scenarios where you want to run a script or command whenever some specific input changes.

    Handling Complex Dependencies: When you need to introduce dependencies between resources that Terraform doesn't implicitly recognize. null_resource can be used to force the dependency when the relationship between resources is more indirect.

    Running Scripts: For running one-off tasks or scripts that aren't directly related to the lifecycle of a specific resource.

Here's a simple example:
hcl

resource "null_resource" "example" {
  triggers = {
    always_run = "${timestamp()}"
  }

  provisioner "local-exec" {
    command = "echo 'This runs every apply!'"
  }
}



- Should you keep terraform code for all envs in one repo?


- Should you keep SA creds on Jenkins worker or inject at the runtime?



More Linux questions?



## LINUX


- How to install new disk on Linux

physically install disk
fdisk -l to check, will appear in dev/ folder
mkfs.ext4 - to format partition
mount the partition sudo mount /dev/sdX1 /mnt/newdisk
update /etc/fstab for automatic mounting at boot
df -h command to confirm that the disk is mounted correctly


- How to allow SSH traffic on Linux?

sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
safe rules: sudo iptables-save | sudo tee /etc/iptables/rules.v4
or use uncomplicated firewall:
sudo ufw allow ssh
sudo ufw enable - enable rules

SELinux/AppArmor: If your system uses SELinux or AppArmor, make sure they are configured not to block SSH.


- What is IP tables on Linux?

IPTables is a user-space utility program that allows a system administrator to configure the IP packet filter rules of the Linux kernel firewall, implemented as different Netfilter modules. It is a powerful tool for managing network traffic and providing security measures by defining rules that govern network connectivity.


- How to start an Apache seerver on Linux?

Update your package index:
bash

sudo yum update

Install Apache:
bash

    sudo yum install httpd

Step 2: Start the Apache Service

    Start Apache:
    bash

sudo systemctl start apache2   # On Debian-based systems
sudo systemctl start httpd     # On Red Hat-based systems

Enable Apache to Start on Boot:
bash

    sudo systemctl enable apache2  # Debian-based
    sudo systemctl enable httpd    # Red Hat-based

Step 3: Configure Firewall (if applicable)

    Allow HTTP and HTTPS traffic through the firewall:
    On Ubuntu/Debian-based Systems (using UFW):
    bash

sudo ufw allow 'Apache Full'

On CentOS/RHEL-based Systems (using Firewalld):
bash

    sudo firewall-cmd --permanent --zone=public --add-service=http
    sudo firewall-cmd --permanent --zone=public --add-service=https
    sudo firewall-cmd --reload

Step 4: Test the Apache Installation

    Open a web browser and visit http://localhost or http://your-server-ip-address.


- How to check if port is open on a linux machine

To check if a port is open on a Linux machine, you can use several different tools and methods. Here are some common approaches:

### Using `netstat`

`netstat` is a versatile network utility tool that can display network connections, routing tables, and interface statistics.

```bash
sudo netstat -tuln
```

- `-t`: Show TCP ports.
- `-u`: Show UDP ports.
- `-l`: Show listening ports.
- `-n`: Show numerical addresses instead of resolving hostnames.

Look for lines that include your specific port number in the list.

### Using `ss`

`ss` is another powerful utility for investigating sockets and is often seen as a replacement for `netstat`.

```bash
ss -tuln
```

Similar options are used as with `netstat` to show listening ports (`-l`), without resolving services with names (`-n`).

### Using `lsof`

`lsof` lists open files and can be used to check ports as well:

```bash
sudo lsof -i :<port_number>
```

Replace `<port_number>` with the actual port number you want to check.

### Using `nmap`

`nmap` is a network scanning tool that can also probe for open ports on local and remote systems. It might not be installed by default.

```bash
sudo nmap -p <port_number> localhost
```

Replace `<port_number>` with the port you want to check. This command scans the specified port on the localhost.

### Using `telnet` or `nc` (Netcat)

You can use `telnet` or `nc` (if installed) to test connectivity to a specific port:

**With `nc`:**

```bash
nc -zv localhost <port_number>
```

**With `telnet`:**

```bash
telnet localhost <port_number>
```

Replace `<port_number>` with the port number you're interested in. If the port is open, you’ll get a response; otherwise, connection attempts will time out or refuse if the port is closed.

### Firewall Configurations

Ensure that the appropriate firewall rules allow traffic through or potentially block the port in question. Use `iptables` or `ufw` to list and verify rules related to the port.

```bash
sudo iptables -L -n
sudo ufw status
```

Choose the tool that fits best with your needs and environment. Each of these methods has its own advantages and use cases, depending on whether you're dealing with a system-level investigation or a network security review.


