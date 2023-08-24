pipeline{

    agent any

    stage{"sonar quailty check"

        steps{

            agent{
                
                docker {
                    image 'maven'
                }
            }
            script{

                withSonarQubeEnv(credentialsId: 'sonar') {
                
                sh 'mvn clean package sonar:sonar'

                }
                
            }

        }
    }
}