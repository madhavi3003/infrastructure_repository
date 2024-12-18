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
                    
                    """    
                }
            }
        }
        stage('create eks cluster') {
            steps {
                script {
                    echo 'Hello, World!'  // Prints "Hello, World!" to the console
                    sh """
                    eksctl create cluster --name deploymentcluster --version 1.28 --nodes=1 --node-type=t2.small --region eu-west-1

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
