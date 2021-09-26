
        exec {'yum-update':
                command => '/usr/bin/yum update'
        }
 
        package{'docker.io':
                ensure => present
        }
