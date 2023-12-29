pipeline {
    agent any

    stages {
        stage('Clone Repository') {
            steps {
                git branch: 'main', url: 'https://github.com/TooMuchMays/my-wordpress-site.git'
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    sh 'docker build -t mywordpress:v1 .'
                }
            }
        }

        stage('Run WordPress') {
            steps {
                script {
                    sh 'docker run --name wp_container_test -d -p 8081:80 mywordpress:v1'
                }
            }
        }

        stage('Health Check') {
            steps {
                script {
                    sh 'curl -f http://localhost:8081'
                }
            }
        }
    }

    post {
        always {
            script {
                sh 'docker stop wp_container_test'
                sh 'docker rm wp_container_test'
            }
        }
        success {
            echo 'Health check passed. Job is green.'
        }
        failure {
            echo 'Health check failed. Job is red.'
        }
    }
}

