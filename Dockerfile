# Use official Nginx image as the base image
FROM nginx:latest

# Set working directory in the container
WORKDIR /usr/share/nginx/html

# Copy HTML, CSS, and JavaScript files from the host to the container
COPY index.html .
COPY styles.css css/
COPY script.js js/

# Expose port 80 to the outside world
EXPOSE 8000

# Command to run when the container starts
CMD ["nginx", "-g", "daemon off;"]
