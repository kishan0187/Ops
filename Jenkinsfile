pipeline {
    agent any

    environment {
        IMAGE_NAME = "akhil8078/ops-app"
        // Reference the credential ID we just created
        KUBECONFIG_ID = 'kubeconfig-file'
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
                // This wrapper creates a temporary file with your cluster config
                withCredentials([file(credentialsId: env.KUBECONFIG_ID, variable: 'KUBECONFIG')]) {
                    script {
                        echo 'Deploying to Local Kubernetes...'
                        // The KUBECONFIG env var is now set, so kubectl knows where to go!
                        bat 'kubectl apply -f k8s/ --validate=false'
                        echo 'Deployment successful! App is running locally.'
                    }
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
