pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                // Cloning your GitHub repository
                git 'https://github.com/TooMuchMays/my-wordpress-site.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    // Building a Docker image from your Dockerfile
                    // Replace 'your-image-name' with a suitable name for your Docker image
                    sh 'docker build -t mywordpress:v1 .'
                }
            }
        }

        stage('Run WordPress') {
            steps {
                script {
                    // Running your WordPress Docker container
                    // Replace 'your-container-name' with a suitable name for your Docker container
                    // Ensure the port mapping does not conflict with existing services
                    sh 'docker run --name wp_container_test -d -p 8081:80 your-image-name'
                }
            }
        }

        stage('Health Check') {
            steps {
                script {
                    // Performing a simple health check
                    sh 'curl -f http://localhost:8081'
                }
            }
        }
    }

    post {
        always {
            // Cleanup actions, like stopping and removing the Docker container
            script {
                sh 'docker stop your-container-name'
                sh 'docker rm your-container-name'
            }
        }
        success {
            // Actions to perform if the pipeline succeeds
            echo 'Health check passed. Job is green.'
        }
        failure {
            // Actions to perform if the pipeline fails
            echo 'Health check failed. Job is red.'
        }
    }
}

