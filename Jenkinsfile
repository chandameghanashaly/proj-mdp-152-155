pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('chandameghanashaly-dockerhub')
  }
  stages {
    stage('Build docker image') {
      steps {
        sh 'docker build -t chandameghanashaly/javacal-app .'
      }
    }
    stage('Remove existing container') {
      steps {
        sh 'docker container rm -f app'
      }
    }
    stage('Run container') {
      steps {
        sh 'docker container run -dt --name app -P chandameghanashaly/javacal-app'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push chandameghanashaly/javacal-app'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}