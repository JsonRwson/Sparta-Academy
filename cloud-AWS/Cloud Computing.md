# AWS / Cloud Computing

## Table of Contents
- [What is Cloud Computing?](#what-is-cloud-computing)
- [How do we know if something is in the Cloud (on-prem vs the cloud)](#how-do-we-know-if-something-is-in-the-cloud-on-prem-vs-the-cloud)
- [What are some popular cloud computing services and how are they used?](#what-are-some-popular-cloud-computing-services-and-how-are-they-used)
- [Explain the four main cloud deployment models](#explain-the-four-main-cloud-deployment-models)
- [Explain the three main types of cloud service](#explain-the-three-main-types-of-cloud-service)
- [What are some of the main advantages of the cloud?](#what-are-some-of-the-main-advantages-of-the-cloud)
- [What are some potential pitfalls/disadvantages of using the cloud?](#what-are-some-potential-pitfallsdisadvantages-of-using-the-cloud)
- [What sorts of things do you usually pay for when using the cloud?](#what-sorts-of-things-do-you-usually-pay-for-when-using-the-cloud)
- [What are the four pillars of DevOps? How are they linked to cloud computing?](#what-are-the-four-pillars-of-devops-how-are-they-linked-to-cloud-computing)


## What is Cloud Computing?

Cloud computing is the delivery of computing resources including:

- **Servers**
- **Storage**
- **Databases**
- **Networking**
- **Software**
- **Analytics**
- **Intelligence**

Over the internet, allowing users to access these resources on-demand without needing to manage physical infrastructure.


## How do we know if something is in the Cloud? (On-Prem vs The Cloud)

### **On-Premises**
- **Location**: Hosted within your organization's infrastructure, often physically onsite.  
- **Ownership**: Your company owns and maintains the hardware and software.  
- **Access**: Data and applications are accessed through a local network.  
- **Control**: Full control over the environment, including customization and security.

### **Cloud**
- **Location**: Hosted by a third-party provider (e.g., AWS) in their data centers.  
- **Ownership**: The provider owns and maintains the hardware and software.  
- **Access**: Data and applications are accessed via the internet.  
- **Scalability**: Easily scalable to meet changing demand.


## What are some popular cloud computing services and how are they used?

### **Amazon Web Services (AWS)**  
<img src="https://upload.wikimedia.org/wikipedia/commons/9/93/Amazon_Web_Services_Logo.svg" width="70">

- **Compute**: EC2 (Elastic Compute Cloud) for scalable virtual servers.
- **Storage**: S3 (Simple Storage Service) for object storage.
- **Containers**: Amazon Elastic Kubernetes Service.
- **Database**: RDS (Relational Database Service) for managed databases.
- **Machine Learning**: SageMaker for building, training, and deploying ML models.
- **DevOps**: AWS CodePipeline (CI/CD) service.

### **Microsoft Azure**  
<img src="https://upload.wikimedia.org/wikipedia/commons/a/a8/Microsoft_Azure_Logo.svg" width="70">

- **Compute**: Azure Virtual Machines & Desktops.
- **Containers**: Deploy and scale Azure Kubernetes containers.
- **DevOps**: Azure Pipelines and Test Plan.
- **Database**: Azure SQL for managed relational databases.
- **AI and Analytics**: Azure Machine Learning for building and deploying AI models.

### **Google Cloud Platform (GCP)**  
<img src="https://static-00.iconduck.com/assets.00/google-cloud-icon-2048x1646-7admxejz.png" width="70">

- **Compute**: Compute Engine for virtual machines.
- **Storage**: Cloud Storage for object storage.
- **Containers**: Google Kubernetes Engine (GKE) for container orchestration.
- **Database**: BigQuery for data warehousing and analytics.
- **Machine Learning**: AI Platform for developing and deploying ML models.
- **DevOps**: Cloud Build for CI/CD pipelines.

### **DigitalOcean Cloud**  
<img src="https://upload.wikimedia.org/wikipedia/commons/f/ff/DigitalOcean_logo.svg" width="70">

- **Compute**: Droplets for virtual servers.
- **Storage**: Spaces for scalable object storage.
- **Containers**: Kubernetes for container orchestration.
- **Database**: Managed Databases for PostgreSQL, MySQL, and Redis.
- **Networking**: VPC (Virtual Private Cloud) for secure networking.
- **Developer Tools**: App Platform for building, deploying, and scaling apps.

### **Salesforce Cloud**  
<img src="https://upload.wikimedia.org/wikipedia/commons/thumb/f/f9/Salesforce.com_logo.svg/2560px-Salesforce.com_logo.svg.png" width="70">

- **Sales Cloud**: For sales automation and management.
- **Service Cloud**: For customer service and support.
- **Marketing Cloud**: For marketing automation and analytics.
- **Commerce Cloud**: For e-commerce solutions.
- **Experience Cloud**: For building branded communities and portals.
- **Analytics Cloud**: Tableau CRM for data visualization and business intelligence.


## What are some of the main advantages of the cloud?

- **Global Accessibility** – Access data, applications, and services from anywhere with an internet connection.  
- **Cost Efficiency** – Reduces capital expenditures on hardware; pay only for what you use (pay-as-you-go model).  
- **Scalability & Flexibility** – Instantly scale resources up or down based on demand.  
- **Security & Compliance** – Leading cloud providers offer built-in security, encryption, and compliance tools.  
- **High Performance & Reliability** – Cloud services offer high availability, redundancy, and fast provisioning of resources.  
- **Rapid Deployment & Innovation** – Quickly deploy applications, test new features, and leverage cloud-based AI/ML services.  
- **Automated Management** – Cloud providers handle updates, patches, and maintenance, reducing administrative overhead.  

## Explain the four main cloud deployment models

### **Public Cloud**
- Services are provided by third-party providers over the internet and are available to the general public.
- ✅ Low cost, no need for hardware investment, scalable, and easy to deploy.
- ❌ Security risks due to shared resources, potential performance issues, and limited customization.

### **Private Cloud**
- Cloud infrastructure is exclusively used by a single organization.
- ✅ Greater control over security and customization, improved performance.
- ❌ Higher costs due to hardware and maintenance, limited scalability compared to public cloud.

### **Community Cloud**
- Cloud infrastructure is shared among several organizations with common concerns (e.g., security, compliance).
- ✅ Cost-effective, collaborative environment, shared resources.
- ❌ Limited scalability, potential security concerns.

### **Hybrid Cloud**
- Combines public and private clouds, allowing data and applications to be shared between them.
- ✅ Flexibility, scalability, cost-efficiency, and improved security.
- ❌ Complexity in management and integration, potential security risks

### **Multi-Cloud**
- Using multiple cloud service providers to run applications and services.
- ✅ Avoids Vendor Lock-in: Flexibility to switch providers
- ✅ Redundancy & Reliability: Reduces downtime by distributing workloads.
- ✅ Optimized Performance: Choose the best cloud provider for specific workloads.
- ❌ Increased Complexity: Managing multiple platforms requires expertise.
- ❌ Higher Costs: Additional overhead for data transfers and integration.
- ❌ Security Risks: Requires consistent security policies across providers.

## What are some potential pitfalls/disadvantages of using the cloud?
- **Security Concerns**: Data stored in the cloud is vulnerable to breaches.
- **Downtime**: Cloud providers may experience outages that impact availability.
- **Limited Control**: Users have less control over infrastructure and security.
- **Unexpected Costs**: Pay-as-you-go pricing can lead to high costs if not monitored.
- **Compliance Issues**: Industries with strict regulations may face challenges with cloud compliance.
- **Migration Costs**: Moving large amounts of data to and/or from the cloud can be costly and time consuming.
- **Vendor Lock-in**: Moving from one cloud provider to another can be challenging and costly


## What sorts of things do you usually pay for when using the cloud?
- **Compute Resources**: Virtual machines, serverless computing, containers.
- **Storage**: Object storage (S3, Cloud Storage), block storage, database storage.
- **Networking**: Bandwidth, load balancing, VPNs, dedicated connections.
- **Databases**: Managed relational and NoSQL databases.
- **Security & Compliance**: Identity & access management, encryption, monitoring tools.
- **Machine Learning & AI Services**: Model training, inference, AI-powered analytics.
- **Support & SLA Tiers**: Premium support plans for enterprise users.

## Explain the three main types of cloud service
<img src="https://s7280.pcdn.co/wp-content/uploads/2017/09/saas-vs-paas-vs-iaas.png" width="400">

### **Infrastructure as a Service (IaaS)**
Provides on-demand infrastructure resources (compute, storage, networking, and virtualization). Users manage the OS, middleware, data, and applications.

### **Platform as a Service (PaaS)**
Provides managed hardware and software resources for developing, testing, delivering, and managing cloud applications. Provides a platform to develop a solution, rather than giving the full solution.

### **Software as a Service (SaaS)**
Provides fully managed software applications accessible over the internet, requiring no user maintenance.
Out-of-the-box solution, fully packaged and ready to use.


## What are the four pillars of DevOps? How are they linked to cloud computing?
1. **Collaboration & Communication**: Cloud-based DevOps tools enable teams to work efficiently across geographies.
2. **Automation**: Cloud platforms provide CI/CD pipelines, infrastructure as code (IaC), and automated scaling.
3. **Monitoring & Logging**: Cloud services provide built-in monitoring tools (AWS CloudWatch, Azure Monitor, etc.).
4. **Security & Compliance**: Cloud providers offer security tools like IAM, encryption, and automated compliance checks.

Cloud computing accelerates DevOps by providing scalable resources, automation, and integrated monitoring solutions.
