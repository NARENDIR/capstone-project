pipeline {
    agent any
    
    stages {
        stage('Build') {
            steps {
                sh 'chmod +x build.sh'
                sh './build.sh'
              } 
            }    
   
        stage('Push to Dev') {
            when {
                branch 'dev'
            }
            steps {
                sh 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                sh 'docker push dev/project'
            }
        }
        
        stage('Push to Prod') {
            when {
                branch 'main'
            }
            steps {
                sh 'docker login -u $DOCKERHUB_USERNAME -p $DOCKERHUB_PASSWORD'
                sh 'docker push prod/project'
            }
        }
        
        stage('Deploy') {
            steps {
                 sh 'chmod +x build.sh'
                sh 'deploy.sh'
            }
        }
    } 
}


