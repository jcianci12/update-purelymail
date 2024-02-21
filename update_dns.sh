#!/bin/bash

# Function to prompt user for Hosted Zone ID, website URL, and ownership proof
prompt_user() {
    # Prompt user for Hosted Zone ID
    read -p "Enter your AWS Route 53 Hosted Zone ID: " HOSTED_ZONE_ID

    # Prompt user for website URL
    read -p "Enter your website URL (e.g., yourwebsite.com.au): " DOMAIN_NAME

    # Prompt user for ownership proof
    read -p "Enter your ownership proof (if applicable): " OWNERSHIP_PROOF
}

# Function to update DNS records
update_record() {
    # Replace (WEBSITE_URL) with the provided website URL and (OWNERSHIP_PROOF) with the provided ownership proof
    sed -e "s/(WEBSITE_URL)/$DOMAIN_NAME/g" -e "s|\[your ownership proof\]|$OWNERSHIP_PROOF|g" dns_changes_template.json > dns_changes.json

    # Update DNS records using AWS CLI
    aws route53 change-resource-record-sets \
        --hosted-zone-id "$HOSTED_ZONE_ID" \
        --change-batch "file://dns_changes.json"
}

# Main function
main() {
    # Prompt user for Hosted Zone ID, website URL, and ownership proof
    prompt_user

    # Call the function to update DNS records
    update_record
}

# Call the main function
main
