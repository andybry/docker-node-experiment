pipeline {
    agent any

    environment {
        DOCKER_LOGIN = credentials('DOCKER_LOGIN')
    }

    stages {
        stage('Test') {
            steps {
                sh 'make test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'make jenkins-deploy'
            }
        }
    }
}
