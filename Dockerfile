# Use UBI 8 as the base image
FROM registry.access.redhat.com/ubi8/ubi

# Update the image and install required packages
RUN yum update -y && \
    yum install -y httpd && \
    yum clean all

# Copy the index.html file to the default Apache document root
COPY files/index.html /var/www/html/

# Configure Apache to use SSL
RUN sed -i 's/Listen 80/Listen 8080/g' /etc/httpd/conf/httpd.conf

# Expose ports 8080 and 443
EXPOSE 8080

# Start Apache service
CMD ["/usr/sbin/httpd", "-DFOREGROUND"]
