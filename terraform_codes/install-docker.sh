#!/bin/bash
sudo yum update -y
sudo yum install -y docker git curl
sudo systemctl start docker
sudo systemctl enable docker
sudo usermod -a -G docker ec2-user
