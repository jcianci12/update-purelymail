# AWS Route 53 DNS Record Updater

This script automates the process of updating DNS records on AWS Route 53. It prompts the user for the Hosted Zone ID and the website URL, then updates the DNS records accordingly.

## Prerequisites

- **VS Code with Remote - Containers Extension:** Ensure that you have Visual Studio Code installed with the Remote - Containers extension enabled. This extension allows you to develop inside a container, isolated from your local machine.
- **AWS CLI Add-On:** The devcontainer is configured with the AWS CLI add-on. You will need to log into AWS the first time you run the script within the container.

## Usage

1. Clone this repository or download the script `update_dns_records.sh`.

2. Open the repository folder in Visual Studio Code.

3. When prompted, select the option to reopen the folder in a development container.

4. Ensure you are logged into AWS CLI. If not, run the following command in the terminal and follow the prompts to log in:
    ```bash
    aws configure
    ```

5. Make the script executable:
    ```bash
    chmod +x update_dns_records.sh
    ```

6. Open a terminal within VS Code and run the script:
    ```bash
    ./update_dns_records.sh
    ```

7. Follow the prompts to enter your AWS Route 53 Hosted Zone ID and website URL.

8. The script will update the DNS records accordingly.

## Notes

- The script assumes you have appropriate permissions to update DNS records on AWS Route 53.
- Ensure your `dns_changes_template.json` file contains `(WEBSITE_URL)` as a placeholder where you want to replace the website URL.

## License

This project is licensed under the [MIT License](LICENSE).
