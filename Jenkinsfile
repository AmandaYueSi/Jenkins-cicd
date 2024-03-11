pipeline {
  agent any
  stages {
    stage('Buzz Build Stage') {
      parallel {
        stage('Build Java 17') {
          steps {
            sh './jenkins/build.sh'
            stash(name: 'Buzz java 17', includes: 'target/**')
          }
        }

        stage('Build Java 11') {
          steps {
            stash(name: 'Buzz java 11', includes: 'target/**')
            sh './jenkins/build.sh'
          }
        }

      }
    }

    stage('Buzz Test Stage') {
      parallel {
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

        stage('Testing B 17') {
          agent {
            node {
              label 'java17'
            }

          }
          steps {
            unstash 'Buzz java 17'
            sh '''sleep 10
echo done'''
          }
        }

        stage('Testing A 11') {
          agent {
            node {
              label 'java11'
            }

          }
          steps {
            unstash 'Buzz java 11'
            sh './jenkins/test-all.sh'
          }
        }

        stage('Testing B 11') {
          agent {
            node {
              label 'java11'
            }

          }
          steps {
            unstash 'Buzz java 11'
            sh './jenkins/test-all.sh'
          }
        }

      }
    }

  }
  environment {
    BUZZ_NAME = 'Worker Bee'
  }
}