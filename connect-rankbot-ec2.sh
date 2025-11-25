#!/bin/sh

ssh -L 23306:quanery-suite-prod.caaw4la6kwyp.us-east-1.rds.amazonaws.com:3306 ec2-user@3.87.46.180 -i ~/.ssh/quanery-suite-key-openssh
