pipeline {
  agent any
  stages {
    stage('Install Dependencies') {
      steps {
        sh '''
          npm init -y
          npm install newman newman-reporter-html
        '''
      }
    }
    stage('Run API Tests') {
      steps {
        sh '''
          npx newman run ./postman/collection.json \
            -e ./postman/environment.json \
            -r cli,html \
            --reporter-html-export postman-report.html
        '''
      }
    }
  }
  post {
    always {
      archiveArtifacts artifacts: 'postman-report.html', fingerprint: true
    }
  }
}
