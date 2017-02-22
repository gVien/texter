#!/bin/bash

# install Apache
yum install -y httpd

echo 'LoadModule proxy_module lib64/httpd/modules/mod_proxy.so' >> /etc/httpd/conf/httpd.conf

echo 'LoadModule proxy_http_module lib64/httpd/modules/mod_proxy_http.so' >> /etc/httpd/conf/httpd.conf

echo 'ProxyPass /  http://localhost:9292/' >> /etc/httpd/conf/httpd.conf

echo 'ProxyPassReverse  /  http://localhost:9292/' >> /etc/httpd/conf/httpd.conf

# replace default Document Root
sed -i 's/DocumentRoot \"\/var\/www\/html\"/DocumentRoot \"\/var\/www\/texter\/public\"/g' /etc/httpd/conf/httpd.conf

service httpd start

# Access Denied on Apache Side
# http://stackoverflow.com/questions/1225594/apache-13-permission-denied-in-users-home-directory
setsebool -P httpd_can_network_connect 1
