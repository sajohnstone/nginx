FROM ubuntu:20.04
LABEL author=sjohnstone

# Environment Vars
ARG CONTAINERNAME=default
ENV CONTAINERNAME="${CONTAINERNAME}"

# Install section
RUN apt-get -y update
RUN apt-get -y install nginx
RUN apt-get -y clean


# Configure the custom html message
RUN echo "<!DOCTYPE html><html><head>" > /var/www/html/index.html && \
    echo "<style>body {width: 35em;margin: 0 auto;font-family: Tahoma, Verdana, Arial, sans-serif;}</style>" >> /var/www/html/index.html && \
    echo "</head><body><h1>$CONTAINERNAME</h1>" >> /var/www/html/index.html && \
    echo "<p><em>Thank you for using nginx.</em></p>" >> /var/www/html/index.html && \
    echo "</body></html>" >> /var/www/html/index.html && \
    echo "" >> /var/www/html/index.html

# Expose section
# EXPOSE 80

## It will be started by default. Control it with:
CMD ["nginx", "-g", "daemon off;"]