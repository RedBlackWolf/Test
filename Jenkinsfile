pipeline { 
    environment { 
        repository = "jenkins/rhel8"  //docker hub id와 repository 이름
        DOCKERHUB_CREDENTIALS = credentials('jenkins') // jenkins에 등록해 놓은 docker hub credentials 이름
        dockerImage = '' 
  }
  agent any 
  stages { 
      stage('Building our image') { 
          steps { 
              script { 
                  sh "cat /etc/redhat-release" // war 파일을 현재 위치로 복사 
                  dockerImage = docker.build repository + ":$BUILD_NUMBER" 
              }
          } 
    //   }
    //   stage('Login'){
    //       steps{
    //           sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin' // docker hub 로그인
    //       }
    //   }
    //   stage('Deploy our image') { 
    //       steps { 
    //           script {
    //             sh 'docker push $repository:$BUILD_NUMBER' //docker push
    //           } 
    //       }
    //   } 
    //   stage('Cleaning up') { 
	// 	  steps { 
    //           sh "docker rmi $repository:$BUILD_NUMBER" // docker image 제거
    //       }
    //   } 
  }
    }
    