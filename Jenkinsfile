pipeline {
    agent any  // Runs the pipeline on any available Jenkins agent

    stages {
        stage('create infra') {
            steps {
                script {
                    echo 'Hello, World!'  // Prints "Hello, World!" to the console
                    sh """
                    terraform init
                    terraform plan
                    terraform apply -auto-approve
                    terraform destroy -auto-approve


                    """
                
                    
                    
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
