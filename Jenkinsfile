pipeline {
  agent any
  stages {
    stage('Install Dependencies') {
      steps {
        sh '''
          npm init -y
          npm install newman newman-reporter-htmlextra
        '''
      }
    }
    stage('Run API Tests') {
      steps {
        sh '''
          npx newman run ./postman/collection.json \
            -e ./postman/environment.json \
            -r cli,htmlextra \
            --reporter-htmlextra-export reports/postman-report.html
        '''
      }
    }
  }
  post {
    always {
      archiveArtifacts artifacts: 'reports/postman-report.html', fingerprint: true
    }
  }
}
