pipeline {
  agent any
  stages {
    stage('Build Java 17') {
      agent any
      steps {
        sh 'echo $JAVA_HOME'
        sh './jenkins/build.sh'
        stash(name: 'Buzz java 17', includes: 'target/**')
      }
    }

    stage('Testing A 17') {
      agent {
        node {
          label 'java17'
        }

      }
      steps {
        unstash 'Buzz java 17'
        sh './jenkins/test-all.sh'
      }
    }

    stage('Confirm Deploy to Staging') {
      steps {
        input(ok: 'Yes', message: 'Deploy to Stage')
      }
    }

  }
  environment {
    JAVA_HOME = '/home/ubuntu/.jdks/corretto-17.0.10'
    BUZZ_NAME = 'Worker Bee'
  }
}