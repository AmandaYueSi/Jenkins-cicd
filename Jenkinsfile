pipeline {
  agent any
  stages {
    stage('Buzz Build Stage') {
      steps {
        sh '''echo I am a $BUZZ_NAME
./jenkins/build.sh'''
      }
    }

    stage('Buzz Test Stage') {
      steps {
        sh './jenkins/test-all.sh'
        archiveArtifacts(artifacts: 'target/*.jar', fingerprint: true)
      }
    }

  }
  environment {
    BUZZ_NAME = 'Worker Bee'
  }
}