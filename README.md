# Project 21: Secure IaC Pipeline for EKS Provisioning using AWS STS Web Identity
Create IaC Pipeline that establishes a secure connection with AWS using trusted, third-party web identity provider

## Technologies used:
GitLab CI, AWS EKS, AWS STS, AWS IAM, Terraform, Kubernetes

## Project Description:
AWS Cloud Configuration:
- Configure Authentication with GitLab OIDC Identity Provider
> - Create Web Identity on AWS cloud
> - Create IAM Role with with GitLab’s Identity Provider as Trusted Entity
GitLab Pipeline Configuration
> - Add Pipeline configuration that establishes a secure connection with temporary credentials on every jobexecution
Terraform Configuration in Release Pipeline:
> - Configure TF commands to provision EKS cluster

