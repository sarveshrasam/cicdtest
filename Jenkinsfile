pipeline {
        agent any
        tools {
                terraform 'Terraform'
        }

        environment {
        AWS_ACCESS_KEY_ID     = credentials('AWS_ACCESS_KEY_ID')
        AWS_SECRET_ACCESS_KEY = credentials('AWS_SECRET_ACCESS_KEY')
        }

        stages {
                stage('Git checkout'){
                        steps {
                                git branch: 'main', credentialsId: 'github', url: 'https://github.com/sarveshrasam/cicdtest.git'
                        }
                }

                stage('Terraform init'){
                        steps {
                                sh label: '', script: 'terraform init'
                        }
                }

                stage('Terraform apply'){
                        steps {
                                sh label: '', script: 'terraform apply --auto-approve'
                        }
                }
				
		stage('Execute Ansible'){
			steps {
				ansiblePlaybook credentialsId: 'private-key', disableHostKeyChecking: true, installation: 'ansible', inventory: 'inventory', playbook: 'install-apache.yml'
			}
		}

        }
}
