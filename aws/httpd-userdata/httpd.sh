#!/bin/bash
yum update -y	#update your OS

#Installing and Configuring SSM agent in EC2 instance
mkdir -p /tmp/ssm
curl https://s3.amazonaws.com/ec2-downloads-windows/SSMAgent/latest/linux_amd64/amazon-ssm-agent.rpm -o /tmp/ssm/amazon-ssm-agent.rpm
sudo yum install -y /tmp/ssm/amazon-ssm-agent.rpm
sudo systemctl start amazon-ssm-agent
sudo systemctl enable amazon-ssm-agent


#Installing and Configuring httpd 
yum install httpd.x86_64 -y # Install your httpd package
systemctl start httpd.service #start httpd
systemctl enable httpd.service # enable httpd
echo "<h1>Hello World from $(hostname)</h1>" > /var/www/html/index.html  #add the content to web page



