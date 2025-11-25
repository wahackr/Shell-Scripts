#!/bin/bash

# Prompt user to select environment
echo "Select environment to connect:"
echo "1) dev"
echo "2) test"
echo "3) prod"
read -p "Enter choice (1-3): " env_choice

case $env_choice in
    1)
        ENV="dev"
        LOCAL_PORT=3306
        RDS_HOST="quanery-suite-dev.caaw4la6kwyp.us-east-1.rds.amazonaws.com"
        read -p "Enter dev EC2 IP address: " EC2_IP
        ;;
    2)
        ENV="test"
        LOCAL_PORT=13306
        RDS_HOST="quanery-suite-test.caaw4la6kwyp.us-east-1.rds.amazonaws.com"
        read -p "Enter test EC2 IP address: " EC2_IP
        ;;
    3)
        ENV="prod"
        LOCAL_PORT=23306
        RDS_HOST="quanery-suite-prod.caaw4la6kwyp.us-east-1.rds.amazonaws.com"
        EC2_IP="3.87.46.180"
        ;;
    *)
        echo "Invalid choice. Exiting."
        exit 1
        ;;
esac

echo "Connecting to $ENV environment..."
echo "Local port: $LOCAL_PORT -> RDS: $RDS_HOST:3306"
echo "EC2 IP: $EC2_IP"

ssh -L ${LOCAL_PORT}:${RDS_HOST}:3306 ec2-user@${EC2_IP} -i ~/.ssh/quanery-suite-key-openssh
