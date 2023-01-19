def img
pipeline {


	environment {
        	registry = "20120375/mmt-nc"
        	registryCredential = 'docker-token'
        	dockerImage = ''
	}
    agent any
    stages {
        stage('checkout') {
                git 'https://github.com/20120630/mmt-nc.git'
            
        }
        stage('Build') {
		steps {
			script {
				img = registry + ":${env.BUILD_ID}"
                 		println ("${img}")
                  		dockerImage = docker.build("${img}")	
			}
		}
		
	}
	stage('Push') {

		steps {
                	script {
                   		docker.withRegistry( 'https://registry.hub.docker.com ', registryCredential ) {
                        	dockerImage.push()
                   		 }
			}
		}
	}
	stage('Run') {
		environment {
			
		nameImage ="20120375/mmt-nc:${env.BUILD_ID}"
		}
			
			bat 'docker run -p 3000:3000 ${nameImage}'
			
		
	}  
	}

}
