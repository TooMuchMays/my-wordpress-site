# Start with the official WordPress image
FROM wordpress:latest

# Update packages and install additional dependencies
RUN apt-get update && apt-get install -y \
    less \
    vim

# You can install additional PHP extensions if required
# RUN docker-php-ext-install mysqli pdo pdo_mysql

# Copy additional files or configurations if necessary
# COPY ./your-config-file.php /var/www/html/

# Ensure scripts are executable if you're adding any
# RUN chmod +x /path/to/your/script.sh

# Set environment variables if necessary
# ENV VARIABLE_NAME=value

# Expose port 80 (the port Apache is listening on)
EXPOSE 80

# The base image already has the necessary CMD to start Apache and WordPress

