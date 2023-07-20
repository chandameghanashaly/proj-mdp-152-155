pipeline {
  agent any
  options {
    buildDiscarder(logRotator(numToKeepStr: '5'))
  }
  environment {
    DOCKERHUB_CREDENTIALS = credentials('Meghana')
  }
  stages {
    stage('Build docker image') {
      steps {
        sh 'docker build -t chandameghanashaly/javacal-app .'
      }
    }
    stage('Run container') {
      steps {
        sh 'docker container run -dt --name app3 -P chandameghanashaly/javacal-app'
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
