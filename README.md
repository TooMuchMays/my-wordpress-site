## Overview

This repository contains the code and configuration for a WordPress website. It's designed to be built and deployed using Docker and Jenkins for continuous integration and delivery.

## Project Structure
### Prerequisites:
- Docker 
- Jenkins 
- Git

#### Dockerfile:
Contains the Docker configuration to build the WordPress site image.
#### docker-compose.yml:
Defines the services, networks, and volumes for running the WordPress site.
#### Jenkinsfile:
Contains the pipeline definition for automating the build, test, and deployment process.

## Getting Started

These instructions will get you a copy of the project up and running on your local machine for development and testing purposes.

### Installations:

1. Install Jenkins - https://cutt.ly/GetJenkins
2. Install Docker - https://cutt.ly/GetDocker

## Jenkins instructions:
1. After installing Jenkins, Open Jenkins and press "New Item".
2. Under "New Item" choose a name for your project and "Pipeline" and click "Ok".
3. Scroll down and unde "Pipeline - Definition" choose "Pipeline script from SCM".
4. Under SCM choose "Git".
5. Under "Repository URL" paste the following URL:
https://github.com/TooMuchMays/my-wordpress-site.git
6. Under branch specifier change "*/master" to "*/main".
7. Under "Script Path" paste: "Jenkinsfile" and save.

Now go to your Dashboard and Run your pipeline.

## Acknowledgments

Jenkins for automation  
Docker for containerization  
WordPress community for support and resources 
