pipeline {
  agent any
  stages {
    stage('Buzz Build Stage') {
      steps {
        echo "I am a ${BUZZ_NAME}"
        sh './jenkins/build.sh'
        archiveArtifacts(artifacts: 'target/*.jar', fingerprint: true)
      }
    }

    stage('Buzz Test Stage') {
      parallel {
        stage('Buzz Test Stage') {
          steps {
            sh './jenkins/test-all.sh'
          }
        }

        stage('Testing B') {
          steps {
            sh '''sleep 10
echo done'''
          }
        }

      }
    }

  }
  environment {
    BUZZ_NAME = 'Worker Bee'
  }
}