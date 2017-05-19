pipeline {
    agent any

    stages {
        stage('Test') {
            steps {
                sh 'ls -l'
                sh 'make test'
            }
        }
        stage('Deploy') {
            steps {
                sh 'make deploy'
            }
        }
    }
}
