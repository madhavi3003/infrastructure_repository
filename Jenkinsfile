pipeline {
    agent any  // Runs the pipeline on any available Jenkins agent

    stages {
        stage('Hello World') {
            steps {
                script {
                    echo 'Hello, World!'  // Prints "Hello, World!" to the console
                }
            }
        }
    }

    post {
        always {
            echo 'Pipeline finished.'  // Prints "Pipeline finished." after the pipeline is done
        }
    }
}
