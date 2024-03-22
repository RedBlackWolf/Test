pipeline {
  environment {
    registryCredential = "docker"
  }

    agent {
        kubernetes {
            yaml """
apiVersion: v1
kind: Pod
metadata:
  labels:
    jenkins-build: app-build
    some-label: "build-app-${BUILD_NUMBER}"
spec:
  containers:
  - name: kaniko
    image: gcr.io/kaniko-project/executor:v1.5.1-debug
    imagePullPolicy: IfNotPresent
    command:
    - /busybox/cat
    tty: true
    volumeMounts:
      - name: jenkins-docker-cfg
        mountPath: /kaniko/.docker
  volumes:
  - name: jenkins-docker-cfg
    projected:
      sources:
      - secret:
          name: docker-credentials
          items:
            - key: .dockerconfigjson
              path: config.json
"""
        }
    }
    

  stages {
    stage('Checkout') {
      steps {
        script {
          git url: 'https://github.com/kmaster8/flask-helloworld.git', credentialsId: ''
          sh 'ls -la'
        }   
      }
    }
    
    stage('build') {
        steps {
            container('kaniko') {
            sh '/kaniko/executor --context `pwd` \
               --destination docker.io/kmaster8/helloworld:2.0 \
               --insecure \
               --skip-tls-verify  \
               --cleanup \
               --dockerfile Dockerfile \
               --verbosity debug'
            }
        }
    }
  }
}