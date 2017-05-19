pipeline {
    agent any

    environment {
        DOCKER_USER = credentials('DOCKER_LOGIN_usr')
        DOCKER_PASSWORD = credentials('DOCKER_LOGIN_pwd')
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
