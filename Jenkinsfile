pipeline {
  agent any
  stages {
    stage('Install Dependencies') {
      steps {
        sh '''
          rm -rf node_modules package-lock.json
          npm install newman@latest newman-reporter-htmlextra@latest --legacy-peer-deps
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
