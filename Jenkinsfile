pipeline {
    agent any

    stages {
        stage('Build Java App') {
            steps {
                script {
                    docker.image('maven:3.8.1-adoptopenjdk-11').inside {
                        sh 'mvn clean package'
                    }
                }
            }
        }

        stage('Archive JAR') {
            steps {
                archiveArtifacts artifacts: 'target/*.jar', fingerprint: true
            }
        }
    }
}
