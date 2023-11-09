pipeline {
    agent any

    environment {
        DOCKER_HUB_USERNAME = credentials('narendiranr2')
        DOCKER_HUB_PASSWORD = credentials('dckr_pat_325C7oay9o3gjdQyyZz9d0npX2Y')
    }

    stages {
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

