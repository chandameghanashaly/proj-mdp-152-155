pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('docker')
  }
  stages {
    stage('Build docker image') {
      steps {
        sh 'docker build -t chandameghanashaly/cal-app .'
      }
    }
    stage('Run container') {
      steps {
        sh 'docker container run -dt --name app9 -P chandameghanashaly/cal-app'
      }
    }
    stage('Show container list') {
      steps {
        sh 'docker container ls'
      }
    }
    stage('Login') {
      steps {
        sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
      }
    }
    stage('Push') {
      steps {
        sh 'docker push chandameghanashaly/cal-app'
      }
    }
  }
  post {
    always {
      sh 'docker logout'
    }
  }
}
