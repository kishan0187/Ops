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
                    bat "docker build -t %IMAGE_NAME%:latest ."
                }
            }
        }

        stage('Deploy to Kubernetes') {
            steps {
                script {
                    echo 'Deploying to Local Kubernetes...'
                    // Added --validate=false to bypass Windows/kubectl version mismatches
                    bat 'kubectl apply -f k8s/ --validate=false'
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
            echo "Success! Project i Assessment Complete."
        }
    }
}
