pipeline {
    agent any

    environment {
        IMAGE_NAME = 'tarun63/simple-java-app'
        IMAGE_TAG  = 'latest'
    }

    stages {
        stage('Build with Maven') {
            agent {
                docker {
                    image 'maven:3.8.1-adoptopenjdk-11'
                    args '-v $HOME/.m2:/root/.m2'
                }
            }
            steps {
                sh 'mvn clean package'
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
}
