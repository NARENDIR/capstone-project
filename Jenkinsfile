pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
               git branch: 'main',
               url: 'https://github.com/NARENDIR/capstone-project.git'
            }
        }
        stage('Build and Push Docker Image') {
            steps {
                script {
                    if (env.BRANCH_NAME == 'origin/dev') {
                        sh './build.sh'
                        withDockerRegistry([credentialsId: 'docker-hub-credentials', url: 'https://index.docker.io/v1/']) {
                            sh 'docker tag project narendiranr2/dev'
                            sh 'docker push narendiranr2/dev'
                        }
                    } else if (env.BRANCH_NAME == 'origin/main') {
                        sh './build.sh'
                        withDockerRegistry([credentialsId: 'docker-hub-credentials', url: 'https://index.docker.io/v1/']) {
                            sh 'docker tag project narendiranr2/prod'
                            sh 'docker push narendiranr2/prod'
                            error 'Deployment error'
                        }
                    }
                }
            }
        }
    }
    }

