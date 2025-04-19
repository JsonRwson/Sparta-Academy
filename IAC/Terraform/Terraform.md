# Introduction to Terraform

Terraform is an Infrastructure as Code (IaC) tool developed by HashiCorp that allows you to define, provision, and manage infrastructure across multiple cloud providers and services through code. It uses HashiCorp Configuration Language (HCL), which is designed to be both human-readable and machine-friendly.

## Key Characteristics of Terraform

- **Declarative Syntax**: You specify the desired end state of your infrastructure, and Terraform determines how to achieve it.
- **Open Source**: The core functionality is free and open source, with an enterprise version available for additional features.
- **Cloud Agnostic**: Works with AWS, Azure, Google Cloud, and many other providers through a plugin-based architecture.
- **Expressive and Extensible**: Supports variables, modules, and custom providers to enhance functionality.
- **State Management**: Keeps track of your infrastructure in a state file, enabling Terraform to make incremental changes.
- **Idempotent**: Running the same configuration multiple times will result in the same outcome.

## Benefits Across the Software Development Lifecycle

### Production Environments
- **Scalability**: Easily scale resources up or down by changing configuration parameters.
- **Consistency**: Ensures the same infrastructure is deployed every time.
- **Compliance**: Infrastructure code can be version-controlled, audited, and validated for compliance requirements.
- **Reduced Human Error**: Automation reduces the risk of misconfiguration.

### Testing Environments
- **Reproducibility**: Create identical testing environments consistently.
- **Quick Provisioning**: Spin up test environments rapidly for testing code changes.
- **Integration with CI/CD**: Automate infrastructure deployment as part of your testing pipeline.

### Disaster Recovery
- **Automated Failover**: Quickly provision resources in different regions or with different providers.
- **Documented Infrastructure**: Your entire infrastructure configuration is documented as code.
- **Rapid Recovery**: Recover from failures by reapplying your Terraform configuration to new resources.

# Core Terraform Workflow

## Terraform Init

The `terraform init` command initializes a working directory containing Terraform configuration files. It:

- Downloads required provider plugins
- Sets up the backend for storing state
- Initializes modules referenced in the configuration

## Terraform Plan

The `terraform plan` command creates an execution plan, showing what actions Terraform will take to reach the desired state described in your configuration files.

This step:
- Reads current state
- Compares with desired state
- Determines necessary changes (create, update, destroy)
- Shows a preview of these changes

## Terraform Apply

The `terraform apply` command executes the actions proposed in a Terraform plan, making the necessary changes to reach the desired state.

This step:
- Creates, updates, or destroys resources as needed
- Updates the state file to reflect the current infrastructure
- Outputs any defined values

## Terraform Destroy

The `terraform destroy` command destroys all resources managed by your Terraform configuration.

This step:
- Terminates all resources defined in your Terraform files
- Updates the state file to remove references to destroyed resources

## Additional Useful Commands

### Terraform Format (fmt)

```hcl
terraform fmt
```

The `terraform fmt` command formats your Terraform configuration files to a canonical format and style, improving readability and consistency. It:
- Standardizes indentation
- Ensures consistent spacing
- Sorts arguments and blocks

### Terraform Validate

```hcl
terraform validate
```

Validates the syntax and internal consistency of Terraform configuration files without accessing any remote services.

### Terraform State

```hcl
# List resources in state
terraform state list

# Show details of a specific resource
terraform state show aws_instance.example

# Remove a resource from state
terraform state rm aws_instance.example
```

Provides advanced state management capabilities.

# Terraform Configuration

## Provider Configuration

```hcl
provider "aws" {
  region = "eu-west-1"
  profile = "default"
}
```

Providers are plugins that Terraform uses to interact with cloud providers, SaaS providers, and other APIs.

## Resource Declaration

```hcl
resource "aws_instance" "web_server" {
  ami           = "ami-0c55b159cbfafe1f0"
  instance_type = "t2.micro"
  
  tags = {
    Name = "WebServer"
    Environment = "Production"
  }
}
```

Resources are the most important element in Terraform - they represent infrastructure objects like virtual networks, compute instances, or DNS records.

## Variables

Input variables let you customize aspects of Terraform modules without altering the module's own source code.
<br>This functionality allows you to share modules across different Terraform configurations, making your module composable and reusable.

<br>When you declare variables in the root module of your configuration, you can set their values using CLI options and environment variables.

### Benefits of using Variables

- **DRY (Don't Repeat Yourself)** - Reuse values across your configuration
- **Debugging/Refactoring** - Change values in one place instead of throughout your code
- **Readability** - Make your code more self-documenting
- **Security** - Separate sensitive values from your code
- **Collaboration** - Team members can work with different values without modifying core code
- **Environment Management** - Deploy to different environments using the same code with different variable values

### 1. Hardcoded Values (The Problem)

When starting with Terraform, you might write configuration like this:

```hcl
resource "aws_instance" "web_server" {
  ami           = "ami-0a887e401f7654935"
  instance_type = "t2.micro"
  tags = {
    Name = "WebServer"
    Environment = "Development"
  }
}
```

Problems with hardcoding:
- Values can't be changed without editing code
- No separation of configuration from implementation
- Can't easily deploy to different environments
- Risk of exposing sensitive information in version control

### 2. Using variables.tf

A better approach is to define variables in a `variables.tf` file:

```hcl
# variables.tf
variable "ami_id" {
  description = "The AMI to use for the EC2 instance"
  type        = string
  default     = "ami-0a887e401f7654935"
}

variable "instance_type" {
  description = "The type of EC2 instance to launch"
  type        = string
  default     = "t2.micro"
}

variable "environment" {
  description = "Deployment environment (e.g. dev, staging, prod)"
  type        = string
  default     = "Development"
}
```

Then reference these variables in your configuration:

```hcl
# main.tf
resource "aws_instance" "web_server" {
  ami           = var.ami_id
  instance_type = var.instance_type
  tags = {
    Name        = "WebServer"
    Environment = var.environment
  }
}
```

Benefits:
- Code is more readable with descriptive variable names
- Default values make local development easier
- Type constraints help catch errors early
- Variable descriptions document the purpose of each value

### 3. Using .tfvars Files

For environment-specific values, create `.tfvars` files:

```hcl
# dev.tfvars
ami_id       = "ami-0a887e401f7654935"
instance_type = "t2.micro"
environment  = "Development"
```

```hcl
# prod.tfvars
ami_id       = "ami-0b2cce42caec4ca99"
instance_type = "t2.large"
environment  = "Production"
```

Apply these variables using:

```bash
terraform plan -var-file="dev.tfvars"
terraform apply -var-file="dev.tfvars"

# Or for production:
terraform plan -var-file="prod.tfvars"
terraform apply -var-file="prod.tfvars"
```

These variables will overwirte the defautl values in the variables.tf file
<br>This allows variables to be hotswapped for the environment, improving modularity