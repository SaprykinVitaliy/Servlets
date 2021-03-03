pipeline {
    agent any
    stages {
        stage('Maven prep'){
            export MAVEN_HOME="$MAVEN_HOME"
            export PATH=$PATH:$MAVEN_HOME/bin
            mvn --version
        }
        stage('Build') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/SaprykinVitaliy/Servlets'

                // Run Maven on a Unix agent.
                sh "mvn -Dmaven.test.failure.ignore=true clean package"

                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }

            post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    junit '**/target/surefire-reports/TEST-*.xml'
                    archiveArtifacts 'target/*.jar'
                }
            }
        }
    }
}