
# :pisces: ReactJS Nike Ecommerce Clone

This project is a ReactJS-based clone of the Nike ecommerce website. It aims to replicate the core functionality and design of the original site, providing users with a familiar experience.
![nike-clone](https://github.com/mohsin-786/nike-clone-ingress/assets/109455638/e2b8e06d-7318-4559-8904-ff6235b4bf38)



# :placard: Diagram
![ingress](https://github.com/Dhiman23/nike-ci-cd/blob/infra/diagram.png)

Nike React Application - DevOps Implementation
This repository contains the DevOps implementation for a React-based Nike application. The project showcases a fully automated CI/CD pipeline, leveraging various DevOps tools and practices to achieve continuous integration, delivery, and deployment.

Table of Contents
Project Overview
Infrastructure Setup
Terraform & GitHub Actions
Continuous Integration
Jenkins Integration
Docker, Trivy, SonarQube
Continuous Deployment
GitOps with ArgoCD
Monitoring & Alerts
How to Get Started
Contributing
License
Project Overview
This project DevOpsifies a React-based Nike application, incorporating the following features:

Automated Infrastructure Provisioning: Using Terraform scripts, provision an EKS cluster, Jenkins server, and a monitoring server.
Continuous Integration: Jenkins is configured to integrate various tools like Docker, Trivy, and SonarQube to manage the CI pipeline.
Continuous Deployment: Using a GitOps approach, ArgoCD is employed to automatically deploy Kubernetes manifests, including services, ingresses, and deployments.
Monitoring: Implemented monitoring using Prometheus and Grafana.
Infrastructure Setup
Terraform & GitHub Actions
The infrastructure for the application is managed using Terraform. GitHub Actions is used to automate the provisioning process.

GitHub Actions: Automates the execution of Terraform scripts to provision an EKS cluster, Jenkins server, and monitoring server in AWS.
Terraform: Infrastructure as Code (IaC) tool used for setting up the Kubernetes cluster (EKS), Jenkins, and monitoring tools.
Key Terraform Resources
EKS Cluster: Managed Kubernetes cluster for deploying the application.
Jenkins Server: Automates the CI pipeline, integrates with Docker, Trivy, SonarQube, and more.
Monitoring Server: Provisioned to collect and visualize metrics and logs.
Continuous Integration
Jenkins Integration
Jenkins is used for automating the CI part of the project. The following tools are integrated into the pipeline:

Docker: Used to containerize the React application.
Trivy: A security scanner for Docker images, ensuring that the images are free from vulnerabilities.
SonarQube: Static code analysis tool that ensures code quality.
Docker Image Tagging
The CI pipeline automatically updates the Docker image tag based on the build number from Jenkins. This updated image is then pushed to the Docker registry.

Helm Deployment
The CI pipeline updates the Helm chart with the new Docker image tag. This allows the application to be deployed with the latest image in the Kubernetes cluster.

Continuous Deployment
GitOps with ArgoCD
ArgoCD is used to automate the deployment of the application in the Kubernetes cluster. The GitOps approach ensures that the state of the cluster matches the desired state defined in the Git repository.

Kubernetes Manifests: Managed using Helm charts, including Services, Ingresses, and Deployments.
ArgoCD: Continuously monitors the Git repository and applies any changes to the Kubernetes cluster.
Monitoring & Alerts
Prometheus: Collects metrics from the Kubernetes cluster and the application.
Grafana: Visualizes the collected metrics and provides dashboards for monitoring.
How to Get Started
Clone the Repository:

bash
Copy code
git clone https://github.com/Dhiman23/nike-ci-cd.git
cd nike-ci-cd
Provision Infrastructure:

Ensure that the necessary environment variables are set up for Terraform.
Trigger the GitHub Action to provision the infrastructure.
Setup Jenkins:

Access the Jenkins server and set up the pipeline using the provided Jenkinsfile.
Deploy the Application:

ArgoCD will automatically deploy the application once the CI pipeline is complete.
Monitor the Application:

Access Grafana dashboards to monitor the application’s performance and health.
Contributing
Contributions are welcome! Please submit a pull request or open an issue to discuss your ideas.

License
This project is licensed under the MIT License - see the LICENSE file for details.



# :man_technologist: Author

- this project is Devopsified by SAJAL DHIMAN




