pipeline {
    agent any
    tools{
        maven 'M2_HOME'
    }
    environment {
    registry = '730137084652.dkr.ecr.us-east-1.amazonaws.com/dev_test'
    registryCredential = 'ecr-access'
    dockerimage = ''
  }
    stages {
        stage('Checkout'){
            steps{
                git branch: 'master', url: 'https://github.com/tabenjamin2000/jenkins-pipeline.git'
            }
        }
        stage('Code Build') {
            steps {
                sh 'mvn clean package'
            }
        }
        stage('Test') {
            steps {
                sh 'mvn test'
            }
        }
        stage('Build Image') {
            steps {
                script{
                    dockerImage = docker.build registry + ":$BUILD_NUMBER"
                } 
            }
        }
        stage('Deploy image') {
            steps{
                script{ 
                    docker.withRegistry("https://"+registry,"ecr:us-east-1:"+registryCredential) {
                        dockerImage.push()
                    }
                }
            }
        }  
    }
}
