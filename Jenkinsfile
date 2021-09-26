pipeline {
    agent none
    stages {
    stage('Install Docker on slave through Ansible') {
            agent{ label 'master'}
            steps {
                sh "ansible-playbook install-docker-playbook.yml -l remote"
            }
        }
        
    }
}
