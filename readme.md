# DNS Record Updater for Mail Servers

This script automates the process of updating DNS records for mail servers, such as PurelyMail, on AWS Route 53. It prompts the user for the Hosted Zone ID and the domain name, then updates the DNS records accordingly.

## Prerequisites

- **VS Code with Remote - Containers Extension:** Ensure that you have Visual Studio Code installed with the Remote - Containers extension enabled. This extension allows you to develop inside a container, isolated from your local machine.
- **AWS CLI Add-On:** The devcontainer is configured with the AWS CLI add-on. You will need to log into AWS the first time you run the script within the container.

## Usage

1. Clone this repository or download the script `update_dns.sh`.

2. Open the repository folder in Visual Studio Code.

3. When prompted, select the option to reopen the folder in a development container.

31. Make sure you have the following credentials set up in aws and that they have access to make changes to route53:
    1. AWS Access Key ID
    2. AWS Secret Acccess Key


4. Ensure you are logged into AWS CLI. If not, run the following command in the terminal and follow the prompts to log in:
    ```bash
    aws configure (you may need to prefix with sudo - if you do, you will also need to prefix with sudo when you run the update_dns.sh script!)
    ```
    1. You will need to enter:
    1. AWS Access Key ID
    2. AWS Secret Acccess Key
    3. Default Region Name - you can use any. us-west-2 will work fine.
    4. Default output format - enter json

5. Make the script executable:
    ```bash
    chmod +x update_dns_records.sh
    ```

6. Open a terminal within VS Code and run the script:
    ```bash
    ./update_dns_records.sh
    ```
61. Head to https://purelymail.com/manage/domain/new to creat the domain. Here you will be provided with the values that you will need with the following prompts.

7. Follow the prompts to enter your AWS Route 53 Hosted Zone ID and domain name.

8. The script will update the DNS records accordingly.

## Customization

- **Mail Server:** This script is designed to update DNS records for mail servers. You can customize it for your specific mail server by modifying the `dns_changes_template.json` file and any other relevant configurations.

## Notes

- The script assumes you have appropriate permissions to update DNS records on AWS Route 53.
- Ensure your `dns_changes_template.json` file contains placeholders where necessary for your mail server configuration.

## License

This project is licensed under the [MIT License](LICENSE).
