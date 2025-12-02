pipeline {
    agent any

    environment {
        IMAGE_NAME = "akhil8078/ops-app" 
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
                    // Build and tag it as "latest" so K8s can find it easily
                    bat "docker build -t %IMAGE_NAME%:latest ."
                }
            }
        }

        // --- PUSH STAGE DELETED (No Login Required) ---

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    echo 'Deploying to Local Kubernetes...'
                    // This uses the image we just built locally
                    bat 'kubectl apply -f k8s/'
                    echo 'Deployment successful! App is running locally.'
                }
            }
        }
    }

    post {
        failure {
            echo "Pipeline failed."
        }
        success {
            echo "Success! No login was needed."
        }
    }
}
