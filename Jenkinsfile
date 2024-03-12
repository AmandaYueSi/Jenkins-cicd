pipeline {
  agent any
  stages {
    stage('Buzz Build Stage') {
      parallel {
        stage('Build Java 17') {
          steps {
            echo  "JAVA_HOME is: ${env.JAVA_HOME}"
            sh './jenkins/build.sh'
            stash(name: 'Buzz java 17', includes: 'target/**')
          }
        }

        stage('Build Java 11') {
          steps {
            sh './jenkins/build.sh'
            stash(name: 'Buzz java 11', includes: 'target/**')
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

    stage('Confirm Deploy to Staging') {
      steps {
        input(ok: 'Yes', message: 'Deploy to Stage')
      }
    }

  }
  environment {
    BUZZ_NAME = 'Worker Bee'
  }
}
