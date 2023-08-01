#!/usr/bin/bash/
# User data for new EC2 instances
# Install httpd (Linux 2 versions)
yum update -y
yum install httpd
systemctl start httpd
systemctl enable httpd
echo <h1>Daydream Travel Agency</h1>
<h3>Your gateway to unforgettable journeys!</h3>
/var/www/html/index.html
