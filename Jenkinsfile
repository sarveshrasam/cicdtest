pipeline{
	agent any
	stages{
		stage('SCM Checkout'){
                        steps{
				git branch: 'main', credentialsId: 'github', url: 'https://github.com/sarveshrasam/cicdtest.git'
			}
		}
		stage('Execute Ansible'){
			steps{
				ansiblePlaybook credentialsId: 'private-key', disableHostKeyChecking: true, installation: 'ansible', inventory: 'awshosts.inv', playbook: 'install-apache.yml'
			}
		}
	}
}
