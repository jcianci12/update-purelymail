
# Function to prompt user for Hosted Zone ID and website URL
prompt_user() {
    # Prompt user for Hosted Zone ID
    read -p "Enter your AWS Route 53 Hosted Zone ID: " HOSTED_ZONE_ID

    # Prompt user for website URL
    read -p "Enter your website URL (e.g., yourwebsite.com.au): " DOMAIN_NAME
}

# Function to update DNS records
update_record() {
    # Replace (WEBSITE_URL) with the provided website URL
    sed "s/(WEBSITE_URL)/$DOMAIN_NAME/g" dns_changes_template.json > dns_changes.json

    # Update DNS records using AWS CLI
    aws route53 change-resource-record-sets \
        --hosted-zone-id "$HOSTED_ZONE_ID" \
        --change-batch "file://dns_changes.json"
}

# Main function
main() {


    # Prompt user for Hosted Zone ID and website URL
    prompt_user

    # Call the function to update DNS records
    update_record
}

# Call the main function
main
