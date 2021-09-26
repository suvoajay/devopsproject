pipeline {
    agent none
    stages {
        
        stage('install puppet on slave') {
            agent { label 'slave'}
            steps {
                echo 'Install Puppet'
                sh "wget -N -O 'puppet7-release-el-8.noarch.rpm' https://yum.puppetlabs.com/puppet7-release-el-8.noarch.rpm"
                sh "chmod 755 puppet7-release-el-8.noarch.rpm"
                sh "sudo rpm -ivh puppet7-release-el-8.noarch.rpm"
                sh "sudo yum install -y puppet-agent"
            }
        }

        stage('configure and start puppet') {
            agent { label 'slave'}
            steps {
                echo 'configure puppet'
                sh "mkdir -p /etc/puppetlabs/puppet"
                sh "if [ -f /etc/puppetlabs/puppet/puppet.conf ]; then sudo rm -f /etc/puppetlabs/puppet.conf; fi"
                sh "echo '[main]\ncertname = slave.localdomain\nserver = puppet' >> ~/puppet.conf"
                sh "sudo mv ~/puppet.conf /etc/puppetlabs/puppet/puppet.conf"
                echo 'start puppet'
                sh "sudo systemctl start puppet"
                sh "sudo systemctl enable puppet"
            }
        }
		
		stage('Git Checkout') {
            agent{ label 'slave'}
            steps {
          
                sh "cd /home/admin/jenkins_slave/workspace/Certification && sudo git checkout master"
            }
        }      
        stage('Install Docker on slave through puppet') {
            agent{ label 'slave'}
            steps {
                sh "sudo /opt/puppetlabs/bin/puppet module install garethr-docker"
                sh "sudo /opt/puppetlabs/bin/puppet apply /home/admin/jenkins_slave/workspace/Certification/dockerce.pp"
            }
        }
        stage('Docker Build and Run') {
            agent{ label 'slave'}
            steps {
                sh "sudo docker rm -f webapp || true"
                sh "cd /home/admin/jenkins_slave/workspace/Certification && sudo docker build -t test ."
                sh "sudo docker run -it -d --name webapp -p 1998:80 test"
            }
			post {
                failure {
                    sh "echo Failure"
					sh "sudo docker rm -f webapp"
                }
			}
        }
	
	}
}
