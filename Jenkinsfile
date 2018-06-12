pipeline {
  agent {
    docker {
      image 'node:6-alpine'
      args '-p 3000:3000 -u 0 '
    }
    
  }
  stages {
    stage('Checkout & Build ') {
      steps {
        git(url: 'https://github.com/rkum79/ansible.git', branch: 'master', changelog: true, credentialsId: '587adf48-114e-49cc-8e19-52bce59625a3', poll: true)
        sh 'npm install'
        sh 'apk update &&   apk add curl'
      }
    }
    stage('Junit Test') {
      steps {
        sh './jenkins/scripts/test.sh'
      }
    }
    stage('Dev Depoyment') {
      steps {
        sh './jenkins/scripts/deliver.sh'
      }
    }
    stage('Dev Test - Curl Http_code') {
      steps {
        sh 'sh ./jenkins/scripts/Http_code_status.sh'
        echo 'Site is working fine with echo ${response} 200 responce'
      }
    }
    stage('Validated & Approval') {
      steps {
        input 'WebSite validation is Finished Approval for cleanup the environment (Click "Proceed" to continue)'
      }
    }
    stage('Cleanup - DEV environment') {
      steps {
        sh './jenkins/scripts/kill.sh'
        echo 'DEV environment is deleted'
      }
    }
  }
  environment {
    CI = 'true'
  }
}