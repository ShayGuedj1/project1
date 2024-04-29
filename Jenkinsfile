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
            }
        }
        
        stage('Install the website') {
            steps {
                // Run Ansible playbook to configure the instance
                sh 'chmod 777 ./install.sh'
                sh './install.sh'
            }
        }
    }
}
