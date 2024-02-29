pipeline {
  agent any
  stages {
    stage('Buzz Build Stage') {
      steps {
        sh './jenkins/build.sh'
      }
    }

    stage('Buzz Test Stage') {
      steps {
        sh './jenkins/test-all.sh'
        archiveArtifacts(artifacts: 'target/*.jar', fingerprint: true)
      }
    }

  }
}