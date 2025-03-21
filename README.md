# Project 20 - Provision EKS Cluster with Secure Access Management

## Technologies used:
AWS EKS, AWS IAM, Terraform, Kubernetes

## Project Description:
Infrastructure as Code configuration to:
- Provision a base EKS cluster
Add Configuration for Access Management:
- Configure AWS IAM Roles for Access on AWS Level
- Define Kubernetes Access with Role Based Access Control
(RBAC) - creating K8s Roles and ClusterRoles
- Configure Mapping between IAM Roles and K8s Users

## Tests and Review:
### Terraform Deployment
![Screenshot 2025-03-21 at 13 27 47](https://github.com/user-attachments/assets/2b3a1dbf-5139-40cc-af2f-2f8325d667ec)

### K8s Admin
Assume aws_iam_role.external_admin
Get pods
![Screenshot 2025-03-21 at 13 53 43](https://github.com/user-attachments/assets/efd03bf3-157b-492c-b50d-e75a74aff81e)

### K8s Developer
Assume aws_iam_role.external_developer
Get pods (Error/ Forbidden, as its role is limited within its namespace. Get pods for its namespace shows no resources instead of an error)
![Screenshot 2025-03-21 at 14 00 45](https://github.com/user-attachments/assets/8fd83027-5d1d-4046-82b9-c1ce8a27ecd8)
