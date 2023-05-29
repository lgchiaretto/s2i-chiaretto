FROM FROM registry.access.redhat.com/ubi8/ubi:latest
LABEL maintainer="chiaretto@redhat.com"

RUN dnf update -y && dnf install -y nginx

# Define mountable directories.
VOLUME ["/etc/nginx/sites-enabled", "/etc/nginx/certs", "/etc/nginx/conf.d", "/var/log/nginx", "/var/www/html"]

COPY files/index.html /var/www/html/

# Define working directory.
WORKDIR /etc/nginx

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
