pipeline {
    agent any

    environment {
        // Define any environment variables if needed
    }

    stages {
        stage('Clone Repository') {
            steps {
                // Cloning your GitHub repository
                git(url: 'https://github.com/TooMuchMays/my-wordpress-site.git', branch: 'master')
            }
        }

        stage('Run Docker Compose') {
            steps {
                script {
                    // Running Docker Compose to start WordPress
                    sh 'docker-compose up -d'
                }
            }
        }

        stage('Health Check') {
            steps {
                script {
                    // Adjust the sleep time as needed to allow WordPress to initialize
                    sh 'sleep 30'
                    // Simple curl command to check if WordPress is up
                    sh 'curl -f http://localhost:8080'
                }
            }
        }
    }

    post {
        success {
            echo 'Health check passed. Job is green.'
        }

        failure {
            echo 'Health check failed. Job is red.'
        }

        always {
            // Clean up, if necessary
            // sh 'docker-compose down'
        }
    }
}
