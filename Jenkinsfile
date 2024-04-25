pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                // Checkout code from GitHub
                git 'https://github.com/ShayGuedj1/project101.git'
            }
        }
        
        stage('Terraform Apply') {
            steps {
                // Run Terraform to provision AWS instance
                sh 'terraform init'
                sh 'terraform apply -auto-approve'
            }
        }
        
        stage('Ansible Configure') {
            steps {
                // Run Ansible playbook to configure the instance
                sh 'ansible-playbook -i inventory ansible/install services.yaml'
            }
        }
    }
}
