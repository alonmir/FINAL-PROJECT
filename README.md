# 🚀 AWS EKS End-to-End DevOps Pipeline

## 📌 Project Overview
A production-ready implementation of a containerized Flask application on AWS EKS. This project automates the entire lifecycle from infrastructure provisioning to application monitoring.

## 🏗️ Architecture
* [cite_start]**IaC (Terraform):** Custom VPC with Public/Private subnets, S3 Backend for state management with DynamoDB locking[cite: 13, 15].
* [cite_start]**Containerization:** Flask app built with a secure `python-slim` base and Gunicorn for Production performance[cite: 32, 53].
* [cite_start]**CI/CD:** Automated GitHub Actions pipeline for ECR image push and EKS Helm deployment[cite: 40, 41, 42].
* [cite_start]**Observability:** Prometheus & Grafana stack for cluster health (Bonus)[cite: 57].

## 🛠️ Components
### 1. Infrastructure (`/infra`)
To deploy the AWS environment:
1. [cite_start]`terraform init` (Initializes S3 backend [cite: 13]).
2. `terraform apply` - provisions VPC, EKS Cluster, and ECR.

### 2. Application (`/app`)
* [cite_start]**Build Command:** `docker build -t flask-app ./app`[cite: 33].
* **Port:** 5000 (Exposed via Gunicorn).

* [cite_start]**Chart:** `devops-alon` version 0.1.0.
* [cite_start]**Access:** Accessible via AWS LoadBalancer DNS on port 5000[cite: 37].

* **FinOps:** Ephemeral infrastructure designed for rapid destruction/re-creation to save costs.
* **Security:** Use of `.gitignore` to protect state files and IAM least-privilege roles.
* **Scalability:** Managed Node Groups across multiple subnets.

---
*Created as per DevOps Technical Assignment requirements.*
