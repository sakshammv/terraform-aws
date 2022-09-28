pipeline {
    agent any
    environment {
        AWS_SECRETS  = credentials('aws_creds')
    }
    
    tools {
        terraform 'terraform-aws'
    }
    stages {
        stage('git checkout') {
            steps {
                git credentialsId: 'gitcred', url: 'https://github.com/sakshammv/terraform-aws'
        }
    }
        stage('terraform init'){
            steps {
                sh """
                  terraform init
                """ 
                
            }
        }

        stage('terraform apply'){
            steps {
                sh """
                  terraform apply -auto-approve
                """ 
                
            }
        }
    }   
}
