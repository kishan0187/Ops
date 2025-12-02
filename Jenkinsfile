pipeline {
    agent any

    environment {
        // Change this to your actual Docker Hub username/repo
        IMAGE_NAME = "akhil8078/ops-app" 
        // Ensure this ID exists in your Jenkins Credentials
        DOCKER_CREDS = credentials('dockerhub-creds-id') 
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build Docker Image') {
            steps {
                script {
                    echo 'Building Docker Image...'
                    // We use "bat" because your Jenkins is on Windows
                    bat "docker build -t %IMAGE_NAME%:%BUILD_NUMBER% ."
                }
            }
        }

        stage('Push to Docker Hub') {
            steps {
                script {
                    echo 'Logging into Docker Hub...'
                    // Windows batch syntax for login
                    bat "docker login -u %DOCKER_CREDS_USR% -p %DOCKER_CREDS_PSW%"
                    
                    echo 'Pushing specific version...'
                    bat "docker push %IMAGE_NAME%:%BUILD_NUMBER%"
                    
                    echo 'Tagging and pushing "latest"...'
                    bat "docker tag %IMAGE_NAME%:%BUILD_NUMBER% %IMAGE_NAME%:latest"
                    bat "docker push %IMAGE_NAME%:latest"
                }
            }
        }
    }
}