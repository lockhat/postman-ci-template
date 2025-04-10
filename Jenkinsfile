pipeline {
  agent any
  stages {
    stage('Install Dependencies') {
      steps {
        sh '''
          rm -rf node_modules package-lock.json
	  npm install --legacy-peer-deps
        '''
      }
    }
    stage('Run API Tests') {
      steps {
        sh '''
          npx newman run ./postman/collection.json \
            -e ./postman/environment.json \
            -r cli,html \
            --reporter-html-export reports/postman-report.html
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
