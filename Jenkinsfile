pipeline {
  agent any
  stages {
    stage('Install Dependencies') {
      steps {
        sh 'npm install -g newman newman-reporter-html'
      }
    }
    stage('Run API Tests') {
      steps {
        sh 'chmod +x run.sh && ./run.sh'
      }
    }
  }
  post {
    always {
      archiveArtifacts artifacts: 'postman-report.html', fingerprint: true
    }
  }
}
