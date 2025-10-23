# My AKS Cluster

This repository contains my personal Azure Kubernetes Service (AKS) cluster configuration and deployment infrastructure. It serves as a comprehensive example of deploying and managing AKS clusters using Infrastructure as Code (IaC) with Terraform and Bicep.

## 🏗️ Project Overview

This project demonstrates:

- **AKS Cluster Deployment**: Automated deployment of Azure Kubernetes Service clusters
- **Infrastructure as Code**: Using Terraform modules for reproducible infrastructure
- **Monitoring & Observability**: Integration with Azure Monitor, Grafana, and Prometheus
- **Container Registry**: Azure Container Registry (ACR) integration
- **Sample Applications**: Demo applications showcasing AKS capabilities including Dapr integration
- **Security & Compliance**: Azure Policy integration and security best practices

## 📁 Repository Structure

- **`aks-automatic-deployment/`** - Terraform configuration for AKS Automatic cluster deployment
- **`cluster-deployment/`** - Standard AKS cluster deployment configurations
- **`github-deployment/`** - GitHub Actions and CI/CD related configurations
- **`modules/`** - Reusable Terraform modules for various Azure resources
- **`apps/`** - Sample applications and Kubernetes manifests
  - **`radius-dapr-demo/`** - Demo application showcasing Dapr and Radius integration
  - **`aks-azure-policy/`** - Azure Policy examples and configurations

## 🚀 Getting Started

This project is designed as a learning resource and reference implementation. Each directory contains its own documentation and configuration files that you can study and adapt for your own use cases.

### Prerequisites

- Azure CLI
- Terraform
- kubectl
- Docker (for containerized applications)

### Usage

1. Fork this repository to your own account
2. Customize the configurations in the `tfvars/` directories
3. Run Terraform to deploy your own version of the infrastructure
4. Explore the sample applications and modify them as needed

## 🔧 Technologies Used

- **Azure Kubernetes Service (AKS)**
- **Terraform** - Infrastructure as Code
- **Azure Bicep** - ARM template language
- **Azure Container Registry (ACR)**
- **Azure Monitor & Application Insights**
- **Grafana** - Monitoring and visualization
- **Prometheus** - Metrics collection
- **Dapr** - Distributed application runtime
- **GitHub Actions** - CI/CD pipelines

## 📚 Learning Objectives

This project reflects my journey in learning:

- AKS cluster management and operations
- Infrastructure as Code best practices
- Kubernetes workload deployment patterns
- Azure cloud-native monitoring solutions
- Container orchestration and microservices architecture

## 🤝 Contributing

**Please note**: This is a personal learning project and I am not currently accepting contributions. However, you are welcome to:

- Fork the repository and make your own modifications
- Use this as a starting point for your own AKS projects
- Report issues or ask questions

For more details, please see [CONTRIBUTING.md](CONTRIBUTING.md).

## 📄 License

This project is licensed under the Apache License 2.0 - see the [LICENSE](LICENSE) file for details.

## 🙋‍♂️ Questions?

If you have questions about this project or the AKS configurations, feel free to [open an issue](../../issues) with the "question" label.
