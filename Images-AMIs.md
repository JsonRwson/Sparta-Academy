# Virtual Machine Images & AMIs

## What is a VM Image?

A virtual machine image is a file or set of files that captures a snapshot of the entire state of a virtual machine at a given point.

This would include:

* **Operating System**: The complete OS installed on the VM.
* **Installed Software and Packages**: All applications and software packages.
* **Configuration and Metadata Files**: Settings and metadata necessary for the VM's operation.
* **File System**: The entire file system of the virtualized disk

## How does a VM image work?

* **Achieving Desired State**: First, the desired state of the virtual machine is configured, including the OS, applications, and settings.

* **Creating the Image**: An image is then created, packaging the OS and virtual disk into a file. This can be in various formats such as:

  * **VDI** (Virtual Disk Image): Commonly used with VirtualBox
  * **VHD** (Virtual Hard Disk): Developed by Microsoft
  * **VMDK** (Virtual Machine Disk): Used by VMware

* **Deployment**: The VM image can be deployed onto a new virtual machine instance, ensuring the VM replicates the original state

## Benefits of using a Virtual Machine Image

* **Portability**: The state of a virtual machine can be migrated to another provider or virtual environment with ease, this makes scaling up or down significantly easier.
* **Consistency**: Regardless of the environment the image is applied to, the resulting state will be consistent, removing the "it works on my machine" problem and any potential user error.
* **Efficiency**: Use of a VM image can eliminate the need to manually configure and set up a virtual instance.
* **Recovery**: Virtual machine images can facilitate quick recovery for deployed applications by restoring virtual machines from previously saved images in case of failures, minimizing downtime

## How to create and use VM image using AWS and EC2 (AMI)

An Amazon Machine Image (AMI) is a template that contains the software configuration necessary to launch an Amazon Elastic Compute Cloud (EC2) instance, acting as a blueprint for creating virtual servers in the AWS cloud

They allow users to quickly and easily launch EC2 instances with a pre-configured environment, saving time and effort compared to manually setting up each instance

* **Deploy an instance**: Launch an EC2 instance, configured with the desired operating system, security group, compute and storage
* **Configure the instance**: Use SSH to access your instance, install your desired packages and bring the instance to the state you wish to replicate
* **Stop the instance**: Change the instance to the stopped state
* **Create the image**: Select actions, create image, provide a name, description and any alterations to the configuration of the image.

From this point onwards, you will have the option to select "My AMIs" and use the image that you created when deploying a new EC2 instance.