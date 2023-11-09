pipeline {
  agent any

  stages {
    stage('Checkout') {
      steps {
        git 'https://github.com/NARENDIR/capstone-project.git', branch: 'dev'
      }
    }

    stage('Build and push to dev repo') {
      when {
        expression { branch == 'dev' }
      }

      steps {
        sh './.build.sh'
      }
    }

    stage('Build and push to prod repo') {
      when {
        expression { branch == 'main' }
      }

      steps {
        sh 'docker tag capstone-project:dev project:latest'
        sh 'docker push narendiranr2/project:latest'
      }
    }
  }
}
