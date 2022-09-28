pipeline {
    agent any
    
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
                  terraform destroy -auto-approve
                """ 
                
            }
        }
    }   
}
