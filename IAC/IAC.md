# IAC

Infrastructure as code (IaC) is the ability to provision and configure computing infrastructure using code instead of manual processes and settings.
<br>
Manual infrastructure management is time-consuming and prone to error — especially at scale.
<br><br>Infrastructure as code lets you define your infrastructure's desired state without including all the steps to get to that state.
<br>It automates infrastructure management so developers can focus on building and improving applications instead of managing environments. <br>Organizations use infrastructure as code to control costs, reduce risks, and respond with speed to new business opportunities.

## Configuration management
Configuration management is the process of maintaining and updating the configuration of an IT infrastructure, including hardware, software, and network components.
<br>It involves identifying the current state of the infrastructure, defining the desired state, and implementing changes to move from the current state to the desired state.
<br>Configuration management helps ensure that the infrastructure is consistent, reliable, and secure.

### Example Tools

- Ansible
- Puppet
- Chef

## Orchistration
Orchestration is the process of automating and coordinating complex workflows and tasks within an IT infrastructure.
<br>It involves managing the interactions and dependencies between different systems, services, and applications to ensure that they work together seamlessly to achieve a specific goal. 
<br><br>Orchestration can involve a variety of tasks, such as provisioning and configuring resources, deploying applications, and monitoring performance.
<br>It is often used to manage the deployment of virtual machines(VM) and containers across multiple servers or data centers.

### Example Tools

- Terraform
- AWS CloudFormation
- Azure Resource Manager (ARM)
- Kubernetes

## Configuration Management Vs Orchestration

Configuration management refers to the process of configuring and managing the software and infrastructure components.
<br>Orchestration, on the other hand, refers to coordinating and managing an application's deployment across multiple systems. 

<br>Configuration management includes tasks such as installing software updates and managing system configurations.
<br>Orchestration, on the other hand, includes tasks such as deploying software and managing scaling and failover.

## An example workflow with Terraform and Ansible for a NodeJS app

1. Set up Local Environment:
    - Set up your Node.js app locally
    - Make sure it works on your machine
    - Understand what dependencies it needs

2. Use Terraform to Create Basic Infrastructure:
    - Write a Terraform file that creates an EC2 instance
    - It also creates a security group allowing HTTP and HTTPS inbound
    - ```
        terraform init    # Set up Terraform
        terraform plan    # Preview what will be created
        terraform apply   # Create the infrastructure
        ```

3. Use Ansible to Configure the Server and Deploy Your App:
    - Create a simple inventory file listing your server
    - Create a basic playbook that:
      - Installs Node.js and npm
      - Copies your application files
      - Installs dependencies (npm install)
      - Sets up a process manager (like PM2)
      - Starts your application

## When to use Infrastructure as Code
- You're deploying repeatedly
  - Multiple environments (dev, test, staging, production)
  - Frequent rebuilds or scaling operations
  - Multiple similar projects
  
- You need consistency and reliability
  - Eliminating human error in complex setups
- You have multiple team members
    - Preventing "it works on my environment" problems
  - Your infrastructure is complex

## When to not use Infrastructure as Code
- One-time deployments
  - Simple proof-of-concept projects
  - Short-lived test environments
  
- Very simple infrastructure
  - Single server setups
- Small team with limited bandwidth
  - Learning curve outweighs immediate benefits
  - No time to develop proper IaC practices
- Static, unchanging environments
    - Legacy systems that rarely change

## Return on Investment

Consider the return on investment (ROI) when using IaC
<br>`Value = (Time saved per operation × Number of operations) - Setup time`

## Benefits of IAC

- Consistency / Environment Duplication
- Reduced Room for Error
- Speed and efficiency
- Benefits of version control due to code