# Lanchonete Database Infrastructure

This repository contains Terraform configurations for provisioning and managing the database infrastructure for the "Lanchonete Na Comanda" application. It is designed to set up a robust and scalable database solution, typically MySQL, in a cloud environment.

## Project Structure

*   `main.tf`: Defines the main database resources, such as the database instance, security groups, and network configurations.
*   `variables.tf`: Declares input variables for the Terraform configuration, allowing for flexible customization (e.g., database size, credentials, environment-specific settings).
*   `outputs.tf`: Defines output values from the Terraform deployment, such as database endpoints or connection strings, which can be used by other services or applications.
*   `terraform.tfvars`: (Optional) Contains default or environment-specific variable values. **Note: Sensitive information should be managed securely and not committed directly to version control.**

## Technologies Used

*   **Terraform**: Infrastructure as Code (IaC) tool for provisioning and managing cloud database resources.
*   **AWS RDS (or similar)**: Managed relational database service (example, can be adapted for other cloud providers like Azure Database for MySQL or Google Cloud SQL).
*   **MySQL**: The relational database engine used.

## Setup and Deployment

### Prerequisites

*   Terraform CLI installed.
*   AWS CLI (or respective cloud provider CLI) configured with appropriate credentials.

### Configuration

1.  **Review `variables.tf`**: Understand the configurable parameters for the database infrastructure.
2.  **Create `terraform.tfvars` (if not present)**: Provide values for your specific deployment.
    ```hcl
    db_instance_type = "db.t3.micro"
    db_name          = "lanchonetenacomanda"
    db_username      = "admin"
    db_password      = "your_secure_password" # IMPORTANT: Use a strong, unique password
    ```
    **Note**: For production environments, consider using a secrets management service (e.g., AWS Secrets Manager, HashiCorp Vault) to handle sensitive variables like `db_password`.

### Deployment Steps

1.  **Initialize Terraform**:
    ```bash
    terraform init
    ```

2.  **Review the Plan**:
    ```bash
    terraform plan
    ```
    This command shows what actions Terraform will take to create or modify your infrastructure.

3.  **Apply the Configuration**:
    ```bash
    terraform apply
    ```
    Confirm the actions by typing `yes` when prompted. This will provision the database infrastructure in your cloud account.

## Outputs

After successful deployment, Terraform will output important information, such as the database endpoint, which can be retrieved using:
```bash
terraform output db_endpoint
