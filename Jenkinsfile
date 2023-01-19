def img
pipeline {


    environment {
        //registry = "20120630/mmt-nc" //To push an image to Docker Hub, you must first name your local image using your Docker Hub username and the repository name that you created through Docker Hub on the web.
        registry = "20120375/mmt-nc"
        registryCredential = 'docker-token'
        dockerImage = ''
        //DOCKERHUB_CREDENTIALS=credentials('dockerhub')
    }
    agent any
    stages {
        stage('checkout') {
            steps {
                git 'https://github.com/20120630/mmt-nc.git'
            }
        }

       // stage ('Stop previous running container'){
            //steps{
                //sh returnStatus: true, script: 'docker stop $(docker ps -a | grep ${JOB_NAME} | awk \'{print $1}\')'
                //sh returnStatus: true, script: 'docker rmi $(docker images | grep ${registry} | awk \'{print $3}\') --force' //this will delete all images
               // sh returnStatus: true, script: 'docker rm ${JOB_NAME}'
            //}
       // }


        //stage('Build Image') {
           // steps {
            //    script {
                  //  img = registry + ":${env.BUILD_ID}"
                   // println ("${img}")
                   // dockerImage = docker.build("${img}")
               // }
           // }
        //}
        
       	 stage('Build') {

			steps {
				script {
						
                img = registry + ":${env.BUILD_ID}"
                 println ("${img}")
                  dockerImage = docker.build("${img}")
               
				//sh 'docker build -t mmtnc:latest .'
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
			
		
		
	stage('Run') {

		steps {
			sh 'docker run -p 3000:3000 20120375/mmt-nc:latest'
			}
		}
    
}
}
}
