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
      steps {
        sh './jenkins/test-all.sh'
      }
    }

  }
  environment {
    BUZZ_NAME = 'Worker Bee'
  }
}
