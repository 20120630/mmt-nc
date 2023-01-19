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
			}}
		
		}
		
		
		

	stage('Push') {

		steps {
				//sh 'docker push 20120375/mmt-nc'
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



        //stage('Test - Run Docker Container on Jenkins node') {
           //steps {

                //sh label: '', script: "docker run -d --name ${JOB_NAME} -p 5000:5000 ${img}"
         // }
        //}

       // stage('Push To DockerHub') {
           // steps {
                //script {
                    //docker.withRegistry( 'https://registry.hub.docker.com ', registryCredential ) {
                       // dockerImage.push()
                   // }
                //}
           // }
       // }

        //stage('Deploy to Test Server') {
           // steps {
                //script {
                   // def port = '5000'
                  //  def stopcontainer = "docker stop ${JOB_NAME}"
                   // def delcontName = "docker rm ${JOB_NAME}"
                   // def delimages = 'docker image prune -a --force'
                   // def drun = "docker run -d --name ${JOB_NAME} -p ${port}:${port} ${img}"
                  //  def ip = "192.168.1.16"
                   // println "${drun}"
                   // sshagent(['docker-test']) {
                       // sh returnStatus: true, script: "ssh -o StrictHostKeyChecking=no docker@${ip} ${stopcontainer} "
                       // sh returnStatus: true, script: "ssh -o StrictHostKeyChecking=no docker@${ip} ${delcontName}"
                       // sh returnStatus: true, script: "ssh -o StrictHostKeyChecking=no docker@${ip} ${delimages}"

                    // some block
                      //  sh "ssh -o StrictHostKeyChecking=no docker@${ip} ${drun}"
                  //  }
               // }
           // }
       // }


    }
}
}
