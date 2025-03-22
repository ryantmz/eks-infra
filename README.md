# Project 21: Secure IaC Pipeline for EKS Provisioning using AWS STS Web Identity
Create IaC Pipeline that establishes a secure connection with AWS using trusted, third-party web identity provider

## Technologies used:
GitHub Actions CI, AWS EKS, AWS STS, AWS IAM, Terraform, Kubernetes

## Project Description:
AWS Cloud Configuration:
- Configure Authentication with GitHub OIDC Identity Provider
> - Create Web Identity on AWS cloud
> - Create IAM Role with with GitHub’s Identity Provider as Trusted Entity
GitHub Pipeline Configuration
> - Add Pipeline configuration that establishes a secure connection with temporary credentials on every jobexecution
Terraform Configuration in Release Pipeline:
> - Configure TF commands to provision EKS cluster

## Tests & Review:
https://github.com/ryantmz/eks-infra/actions/runs/14007342304
Ran GHA pipeline, successfully logging into AWS via OIDC

![Screenshot 2025-03-22 at 10 04 40](https://github.com/user-attachments/assets/068428c8-0dcc-4f24-a419-8c092a375fd2)

GHA pipeline successfully deploying EKS resources, terraform state managed remotely on s3
![Screenshot 2025-03-22 at 09 48 25](https://github.com/user-attachments/assets/0400db3b-9166-47d6-afa5-152344bb0a59)

![Screenshot 2025-03-22 at 09 49 54](https://github.com/user-attachments/assets/551b1206-e719-4b38-9567-bd5579c0d709)

