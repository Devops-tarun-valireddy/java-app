pipeline {
    agent any

    environment {
        IMAGE_NAME = 'tarun63/java-app'
        IMAGE_TAG  = "${BUILD_NUMBER}"
    }

    stages {
        stage('Checkout') {
            steps {
                checkout scm
            }
        }

        stage('Build with Maven') {
            steps {
                script {
                    docker.image('maven:3.8.1-adoptopenjdk-11').inside {
                        sh 'mvn clean package'
                        sh 'ls -lh target/' // Optional
                    }
                }
            }
        }

        stage('Build Docker Image') {
            steps {
                sh 'docker build -t $IMAGE_NAME:$IMAGE_TAG .'
            }
        }

        stage('Push Docker Image') {
            steps {
                withDockerRegistry([ credentialsId: 'dockerhub-creds', url: '' ]) {
                    sh 'docker push $IMAGE_NAME:$IMAGE_TAG'
                }
            }
        }
    }

    post {
    always {
        deleteDir()
    }
}

}
