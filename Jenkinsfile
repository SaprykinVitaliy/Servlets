pipeline {
    tools {
        // Install the Maven version configured as "M3" and add it to the path.
        maven "M3"
    }
    agent any
    stages {
        stage('Check docker'){
            steps {
                sh "docker -v"
            }
        }
        stage('Dockerize') {
            steps {
                // Get some code from a GitHub repository
                git 'https://github.com/SaprykinVitaliy/Servlets'

                // Run Maven on a Unix agent.
                //sh "mvn -Dmaven.test.failure.ignore=true clean package"

                sh "docker build -t notes ."
                sh "docker-compose up -d --remove-orphans"
                sh "docker image prune -f"
                // To run Maven on a Windows agent, use
                // bat "mvn -Dmaven.test.failure.ignore=true clean package"
            }

            /* post {
                // If Maven was able to run the tests, even if some of the test
                // failed, record the test results and archive the jar file.
                success {
                    junit '**//* target/surefire-reports/TEST-*.xml'
                    archiveArtifacts 'target *//*.jar'
                }
            } */
        }
    }
}