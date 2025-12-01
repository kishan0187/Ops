pipeline {
    agent any

    environment {
        PYTHON = "python3"   // change to "python" if that's what your system uses
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Set up venv') {
            steps {
                sh """
                    ${PYTHON} -m venv venv
                    . venv/bin/activate
                    pip install --upgrade pip
                    if [ -f requirements.txt ]; then pip install -r requirements.txt; fi
                """
            }
        }

        stage('Run tests') {
            steps {
                sh """
                    . venv/bin/activate
                    # change this to pytest or whatever you use
                    echo "No tests yet, add pytest here."
                """
            }
        }

        stage('Deploy') {
            when {
                branch 'main'   // only deploy when pushing to main
            }
            steps {
                sh """
                    . venv/bin/activate
                    # EXAMPLES – pick ONE style and implement it properly:

                    # 1) Local run (for learning only, not production)
                    # pkill -f "python app.py" || true
                    # nohup ${PYTHON} app.py > app.log 2>&1 &

                    # 2) If using a deploy.sh script:
                    # chmod +x deploy.sh
                    # ./deploy.sh

                    echo "Deploy step placeholder – wire this to your real server."
                """
            }
        }
    }

    post {
        failure {
            echo "Pipeline failed. Fix your sh*t and push again."
        }
        success {
            echo "Pipeline completed successfully."
        }
    }
}
