pipeline {
  agent any

  stages {
    stage('Build') {
      steps {
        sh 'build.sh'
      }
    }

    stage('Push to Docker Hub') {
      steps {
        sh 'https://hub.docker.com/repository/docker/narendiranr2/dev'
      }
    }

    stage('Deploy') {
      steps {
        sh 'deploy.sh'
      }
    }
  }
}



