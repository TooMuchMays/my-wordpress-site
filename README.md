## Overview

This repository contains the code and configuration for a WordPress website. It's designed to be built and deployed using Docker and Jenkins for continuous integration and delivery.

## Project Structure
### Dockerfile: 
Contains the Docker configuration to build the WordPress site image.
docker-compose.yml: 
Defines the services, networks, and volumes for running the WordPress site.
Jenkinsfile: 
Contains the pipeline definition for automating the build, test, and deployment process.

### Prerequisites:
- Docker 
- Jenkins 
- Git

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Installation:

sh
Copy code
git clone https://github.com/TooMuchMays/my-wordpress-site.git
cd my-wordpress-site

### Build the Docker Image:

sh
Copy code
docker build -t mywordpress:v1 .
Run the Application

### Using Docker:

sh
Copy code
docker run --name wp_container -d -p 8081:80 mywordpress:v1

### Using Docker Compose:

sh
Copy code
docker-compose up -d
Accessing the Application
After starting the application, visit http://localhost:8081 in your web browser to view the WordPress site.

### Continuous Integration and Deployment:
The Jenkinsfile in this repository defines the CI/CD pipeline.

### Pipeline Stages
Clone Repository - Pulls the latest code from the main branch.
Build Docker Image - Builds the Docker image for the WordPress site.
Run WordPress - Deploys the WordPress site in a Docker container.
Health Check - Checks if the WordPress site is up and running.
Cleanup - Stops and removes the Docker container.


## Acknowledgments

Jenkins for automation  
Docker for containerization  
WordPress community for support and resources
